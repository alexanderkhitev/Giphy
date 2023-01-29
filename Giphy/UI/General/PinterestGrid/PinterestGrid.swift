//
//  PinterestGrid.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

protocol PrinterestGridItemProtocol: Identifiable {
    var rowSize: CGSize { get set }
}

struct PinterestGrid: View {

    struct Column: Identifiable {
        let id = UUID()
        var gridItems = [GiphyItem]()
        var columnHeihgt: CGFloat = 0
    }

    let columns: [Column]

    @State var spacing: CGFloat

    init(columns: [Column], numOfColumns: Int, spacing: CGFloat) {
        self.spacing = spacing

//        var columns = [Column]()
//
//        for _ in 0..<numOfColumns {
//            columns.append(Column())
//        }
//
//        // this stores the current height of each column, sot that we can find out which one is the smallest
//        var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)
//
//        for gridItem in gridItems {
//            var smallestColumnIndex = 0
//            var smallestHeight = columnsHeight[0]
//            for i in 1..<columnsHeight.count {
//                let currentHeight = columnsHeight[i]
//                if currentHeight < smallestHeight {
//                    smallestHeight = currentHeight
//                    smallestColumnIndex = i
//                }
//            }
//
//            columns[smallestColumnIndex].gridItems.append(gridItem)
//            columnsHeight[smallestColumnIndex] += gridItem.rowSize.height
//        }
        self.columns = columns
    }

    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(columns) { column in
                LazyVGrid(columns: [.init(.flexible())], spacing: spacing) {
                    ForEach(column.gridItems) { gridItem in
                        GiphyItemRow(giphyItem: gridItem)
                            .frame(width: gridItem.rowSize.width, height: gridItem.rowSize.height)
                            .id(gridItem.id)
                    }
                }
//                LazyVStack(spacing: spacing) {
//                    ForEach(column.gridItems) { gridItem in
//                        GiphyItemRow(giphyItem: gridItem)
//                            .frame(height: gridItem.rowSize.height)
//                    }
//                }
            }
        }
    }
}
