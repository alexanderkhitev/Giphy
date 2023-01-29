//
//  WaterfallGridColumn.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/29/23.
//

import Foundation

class WaterfallGridColumn: ObservableObject, Identifiable {
    let id = UUID()
    var gridItems = [GiphyItem]()
    var columnHeihgt: CGFloat = 0
}
