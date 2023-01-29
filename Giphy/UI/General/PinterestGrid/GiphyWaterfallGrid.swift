//
//  GiphyWaterfallGrid.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

struct GiphyWaterfallGrid: View {
    @ObservedObject var viewModel: GiphyScreenViewModel
    @State var spacing: CGFloat

    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(viewModel.columns) { column in
                LazyVGrid(columns: [.init(.flexible())], spacing: spacing) {
                    ForEach(column.gridItems, id: \.rowID) { gridItem in
                        GiphyItemRow(giphyItem: gridItem)
                            .frame(width: gridItem.rowSize.width, height: gridItem.rowSize.height)
                    }
                }
            }
        }
    }
}
