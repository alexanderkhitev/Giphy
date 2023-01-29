//
//  Mock.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/29/23.
//

import Foundation

class Mock {

    static func giphyItem() -> GiphyItem? {
        guard let url = Bundle.main.url(forResource: "GiphyItemSwiftUI", withExtension: "json") else { return nil }
        do {
            let jsonDecoder = JSONDecoder()
            return try jsonDecoder.decode(GiphyItem.self, from: url)
        } catch {
            return nil
        }
    }
}
