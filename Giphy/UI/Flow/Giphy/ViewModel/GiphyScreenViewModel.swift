//
//  GiphyScreenViewModel.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import Foundation

class GiphyScreenViewModel: ObservableObject {
    // Data
    @Published var giphyData: GiphyData?
    @Published var giphyItems = [GiphyItem]()
    // managers and etc
    private let giphyAPI: GiphyAPI
    private weak var coordinator: GiphyCoordinator?

    init(giphyAPI: GiphyAPI = .init(), coordinator: GiphyCoordinator?) {
        self.giphyAPI = giphyAPI
        self.coordinator = coordinator
    }

    @MainActor
    func loadData() {
        Task {
            do {
                let giphyData = try await giphyAPI.gifs()
                self.giphyData = giphyData
                giphyItems = giphyData.data
            } catch {
                // TODO: - Show error
                debugPrint("[a]: error \(error.localizedDescription)")
            }
        }
    }
}
