//
//  GiphyWaterfallGrid.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

struct GiphyWaterfallGrid: View {
    @ObservedObject var viewModel: GiphyScreenViewModel

    var body: some View {
        let spacing = viewModel.uiData.itemSpacing
        HStack(alignment: .top, spacing: spacing) {
            ForEach(viewModel.columns) { column in
                LazyVGrid(columns: [.init(.flexible())], spacing: spacing) {
                    ForEach(column.gridItems, id: \.rowID) { gridItem in
                        GiphyItemRow(giphyItem: gridItem)
                            .frame(width: gridItem.rowSize.width, height: gridItem.rowSize.height)
                            .onTapGesture {
                                debugPrint("[tapped url \(gridItem.preview.url)]")
                            }
                    }
                }
            }
        }
    }
}
