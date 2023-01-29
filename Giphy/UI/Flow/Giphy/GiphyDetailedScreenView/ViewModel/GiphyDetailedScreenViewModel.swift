//
//  GiphyDetailedScreenViewModel.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/29/23.
//

import Foundation

class GiphyDetailedScreenViewModel: ObservableObject {
    let giphyItem: GiphyItem
    private weak var coordinator: GiphyCoordinator?

    init(giphyItem: GiphyItem, coordinator: GiphyCoordinator?) {
        self.giphyItem = giphyItem
        self.coordinator = coordinator
    }
}
