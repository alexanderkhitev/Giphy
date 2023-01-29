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
    var giphyItems = [GiphyItem]()
    @Published var columns = [PinterestGrid.Column]()
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

                self.giphyItems = giphyItems
                columns = columns(giphyItems)

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
                let offset = giphyItems.count
                let newGiphyItems = try await giphyAPI.gifs(offset: offset).data
                newGiphyItems.forEach({ $0.rowSize = calculateRowSize($0, spacing: 8) })

                var correctedGiphyItems = [GiphyItem]()
                for newGiphyItem in newGiphyItems {
                    if !giphyItems.contains(where: { $0.id == newGiphyItem.id }) {
                        correctedGiphyItems.append(newGiphyItem)
                    }
                }

                giphyItems += correctedGiphyItems
                columns = columns(columns: columns, gridItems: correctedGiphyItems)

                waitPaginationData = false
            } catch {
                // TODO: - Show error
                debugPrint("[a]: error \(error.localizedDescription)")
            }
        }
    }

    private func columns(_ gridItems: [GiphyItem], numOfColumns: Int = 2) -> [PinterestGrid.Column] {
        var columns = [PinterestGrid.Column]()

        for _ in 0..<numOfColumns {
            columns.append(PinterestGrid.Column())
        }

        // this stores the current height of each column, sot that we can find out which one is the smallest
        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)

        for gridItem in gridItems {
            let smallestHeight = columnsHeight.min() ?? 0
            let smallestColumnIndex = columnsHeight.firstIndex(of: smallestHeight) ?? 0

            let smallestColumn = columnsHeight[smallestColumnIndex]


            columns[smallestColumnIndex].gridItems.append(gridItem)
            columns[smallestColumnIndex].columnHeihgt += gridItem.rowSize.height
            columnsHeight[smallestColumnIndex] += gridItem.rowSize.height
        }
        debugPrint("[a]: columnsHeight \(columnsHeight)")
        return columns
    }

    private func columns(columns: [PinterestGrid.Column], gridItems: [GiphyItem], numOfColumns: Int = 2) -> [PinterestGrid.Column] {
        var columns = columns

        // this stores the current height of each column, sot that we can find out which one is the smallest
        var columnsHeight = columns.compactMap({ $0.columnHeihgt })

        for gridItem in gridItems {
            var smallestHeight = columnsHeight.min() ?? 0
            var smallestColumnIndex = columnsHeight.firstIndex(of: smallestHeight) ?? 0

            let smallestColumn = columnsHeight[smallestColumnIndex]

//            for heightItem in columnsHeight.enumerated() {
//                let currentHeight = heightItem.element
//                if currentHeight <= smallestHeight {
//                    smallestHeight = currentHeight
//                    smallestColumnIndex = heightItem.offset
//                }
//            }
//            for i in 1..<columnsHeight.count {
//                let currentHeight = columnsHeight[i]
//                if currentHeight < smallestHeight {
//                    smallestHeight = currentHeight
//                    smallestColumnIndex = i
//                }
//            }

            columns[smallestColumnIndex].gridItems.append(gridItem)
            columnsHeight[smallestColumnIndex] += gridItem.rowSize.height
        }
        return columns
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
