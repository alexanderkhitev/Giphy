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

    class Column: ObservableObject, Identifiable {
        let id = UUID()
        @Published var gridItems = [GiphyItem]()
        var columnHeihgt: CGFloat = 0
    }

    let columns: [Column]

    @State var spacing: CGFloat

    init(columns: [Column], numOfColumns: Int, spacing: CGFloat) {
        self.spacing = spacing
        self.columns = columns
    }

    var body: some View {
        HStack(alignment: .top, spacing: spacing) {
            ForEach(columns) { column in
                LazyVGrid(columns: [.init(.flexible())], spacing: spacing) {
                    ForEach(column.gridItems, id: \.rowID) { gridItem in
                        GiphyItemRow(giphyItem: gridItem)
                            .frame(width: gridItem.rowSize.width, height: gridItem.rowSize.height)
                            .id(gridItem.rowID)
                    }
                }
            }
        }
    }
}
