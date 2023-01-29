//
//  GiphyScreenViewModel.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import Foundation
import SwiftUI

class GiphyScreenViewModel: ObservableObject {
    // Data
    @Published var columns = [WaterfallGridColumn]()
    private var waitPaginationData = false
    // managers and etc
    private let giphyAPI: GiphyAPI
    private weak var coordinator: GiphyCoordinator?
    var mainScreenGeoProxy: GeometryProxy?

    init(giphyAPI: GiphyAPI = .init(), coordinator: GiphyCoordinator?) {
        self.giphyAPI = giphyAPI
        self.coordinator = coordinator
    }

}

// MARK: - Data

extension GiphyScreenViewModel {
    @MainActor
    func loadData() {
        Task {
            do {
                let giphyItems = try await giphyAPI.gifs().data
                giphyItems.forEach({ $0.rowSize = calculateRowSize($0, spacing: 8) })

                columns = createColumns(for: giphyItems)

                waitPaginationData = false
            } catch {
                // TODO: - Show error
                debugPrint("[a]: error \(error.localizedDescription)")
            }
        }
    }

    @MainActor
    func loadPaginatonData() {
        guard !waitPaginationData else { return }
        waitPaginationData = true
        Task {
            // TODO: - Alex improve
            do {
                let offset = columns.compactMap({ $0.gridItems.count }).reduce(.zero, +)
                let newGiphyItems = try await giphyAPI.gifs(offset: offset).data
                newGiphyItems.forEach({ $0.rowSize = calculateRowSize($0, spacing: 8) })

                updateColumns(with: newGiphyItems)

                waitPaginationData = false
            } catch {
                // TODO: - Show error
                debugPrint("[a]: error \(error.localizedDescription)")
            }
        }
    }

    private func createColumns(for gridItems: [GiphyItem], numOfColumns: Int = 2) -> [WaterfallGridColumn] {
        var columns = [WaterfallGridColumn]()

        for _ in 0..<numOfColumns {
            columns.append(WaterfallGridColumn())
        }

        // this stores the current height of each column, sot that we can find out which one is the smallest
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)

        for gridItem in gridItems {
            let smallestHeight = columnsHeight.min() ?? 0
            let smallestColumnIndex = columnsHeight.firstIndex(of: smallestHeight) ?? 0

            columns[smallestColumnIndex].gridItems.append(gridItem)
            columns[smallestColumnIndex].columnHeihgt += gridItem.rowSize.height
            columnsHeight[smallestColumnIndex] += gridItem.rowSize.height
        }
        return columns
    }

    private func updateColumns(with gridItems: [GiphyItem]) {
        for gridItem in gridItems {
            let smallestColumn = columns.min(by: { $0.columnHeihgt < $1.columnHeihgt }) ?? columns[0]
            smallestColumn.gridItems.append(gridItem)
            smallestColumn.columnHeihgt += gridItem.rowSize.height
        }

        objectWillChange.send()
    }
}

// MARK: - UI Helper functions

extension GiphyScreenViewModel {
    private func calculateRowSize(_ giphyItem: GiphyItem, spacing: CGFloat) -> CGSize {
        let screenSize = mainScreenGeoProxy?.size ?? .zero
        let rowWidth = (screenSize.width - spacing) / 2

        let width = CGFloat(Int(giphyItem.preview.width) ?? 0)
        let height = CGFloat(Int(giphyItem.preview.height) ?? 0)

        let multipler = height / width

        let rowHeight = rowWidth * multipler

        let rowSize = CGSize(width: rowWidth, height: rowHeight)
        return rowSize
    }
}
