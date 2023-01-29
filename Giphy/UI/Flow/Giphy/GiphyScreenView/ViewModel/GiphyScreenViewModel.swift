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
    @Published var columns = [GiphyWaterfallGridColumn]()
    @Published var uiData = GiphyScreenViewUIData()
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
                createColumns(for: giphyItems)
                waitPaginationData = false
            } catch {
                UINotificationFeedbackGenerator().notificationOccurred(.error)
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

                updateColumns(with: newGiphyItems)

                waitPaginationData = false
            } catch {
                UINotificationFeedbackGenerator().notificationOccurred(.error)
            }
        }
    }

    // TODO: - alex

    private func createColumns(for gridItems: [GiphyItem]) {
        var columns = [GiphyWaterfallGridColumn]()
        for _ in 0..<uiData.columnsNumber {
            columns.append(GiphyWaterfallGridColumn())
        }
        for gridItem in gridItems {
            gridItem.rowSize = calculateRowSize(gridItem, spacing: uiData.itemSpacing)

            let smallestColumn = columns.min(by: { $0.columnHeight < $1.columnHeight }) ?? columns[0]
            smallestColumn.gridItems.append(gridItem)
            smallestColumn.columnHeight += gridItem.rowSize.height
        }

        self.columns = columns
    }

    private func updateColumns(with gridItems: [GiphyItem]) {
        for gridItem in gridItems {
            gridItem.rowSize = calculateRowSize(gridItem, spacing: 8)
            let smallestColumn = columns.min(by: { $0.columnHeight < $1.columnHeight }) ?? columns[0]
            smallestColumn.gridItems.append(gridItem)
            smallestColumn.columnHeight += gridItem.rowSize.height
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

// MARK: - Buttons

extension GiphyScreenViewModel {
    @MainActor func didSelect(_ giphyItem: GiphyItem) {
        coordinator?.push(.showGiphyItem(giphyItem))
    }
}
