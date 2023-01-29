//
//  GiphyWaterfallGrid.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

struct GiphyWaterfallGrid: View {
    @ObservedObject var viewModel: GiphyScreenViewModel

    private var spacing: CGFloat {
        viewModel.uiData.itemSpacing
    }

    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(viewModel.columns) { column in
                grid(for: column)
            }
        }
    }

    private func grid(for column: GiphyWaterfallGridColumn) -> some View {
        LazyVGrid(columns: [.init(.flexible())], spacing: spacing) {
            ForEach(column.gridItems, id: \.rowID) { giphyItem in
                GiphyItemRow(giphyItem: giphyItem)
                    .frame(width: giphyItem.rowSize.width, height: giphyItem.rowSize.height)
                    .onTapGesture {
                        viewModel.didSelect(giphyItem)
                    }
            }
        }
    }
}
