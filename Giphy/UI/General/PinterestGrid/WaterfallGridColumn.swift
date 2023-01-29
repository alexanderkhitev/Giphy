//
//  WaterfallGridColumn.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/29/23.
//

import Foundation

class WaterfallGridColumn: ObservableObject, Identifiable {
    let id = UUID()
    @Published var gridItems = [GiphyItem]()
    var columnHeight: CGFloat = 0
}

extension WaterfallGridColumn: Equatable {
    static func == (lhs: WaterfallGridColumn, rhs: WaterfallGridColumn) -> Bool {
        lhs.id == rhs.id
    }
}
