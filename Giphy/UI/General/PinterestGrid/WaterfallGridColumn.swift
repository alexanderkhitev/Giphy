//
//  GiphyWaterfallGrid.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/29/23.
//

import Foundation

class GiphyWaterfallGridColumn: ObservableObject, Identifiable {
    let id = UUID()
    @Published var gridItems = [GiphyItem]()
    var columnHeight: CGFloat = 0
}

extension GiphyWaterfallGridColumn: Equatable {
    static func == (lhs: GiphyWaterfallGridColumn, rhs: GiphyWaterfallGridColumn) -> Bool {
        lhs.id == rhs.id
    }
}
