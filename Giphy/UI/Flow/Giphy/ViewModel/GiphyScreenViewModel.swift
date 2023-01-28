//
//  GiphyScreenViewModel.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import Foundation

class GiphyScreenViewModel: ObservableObject {

    private weak var coordinator: GiphyCoordinator?

    init(coordinator: GiphyCoordinator?) {
        self.coordinator = coordinator
    }
}
