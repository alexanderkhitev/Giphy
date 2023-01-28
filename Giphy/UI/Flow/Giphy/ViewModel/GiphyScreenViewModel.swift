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
    private var waitPaginationData = false
    // managers and etc
    private let giphyAPI: GiphyAPI
    private weak var coordinator: GiphyCoordinator?

    init(giphyAPI: GiphyAPI = .init(), coordinator: GiphyCoordinator?) {
        self.giphyAPI = giphyAPI
        self.coordinator = coordinator
    }


}

// MARK: - Data

extension GiphyScreenViewModel {
    @MainActor
    func loadData() {
        Task {
            do {
                let giphyData = try await giphyAPI.gifs()
                self.giphyData = giphyData
                giphyItems = giphyData.data

                waitPaginationData = false
            } catch {
                // TODO: - Show error
                debugPrint("[a]: error \(error.localizedDescription)")
            }
        }
    }

    @MainActor
    func loadPaginatonData() {
        guard !waitPaginationData else { return }
        waitPaginationData = true
        Task {
            // TODO: - Alex improve
            do {
                let offset = giphyItems.count
                let giphyData = try await giphyAPI.gifs(offset: offset)

                let currentGiphyItems = giphyItems

                var newGiphyItems = [GiphyItem]()
                for giphyItem in giphyData.data {
                    if !currentGiphyItems.contains(where: { $0.id == giphyItem.id }) {
                        newGiphyItems.append(giphyItem)
                    }
                }

                giphyItems.append(contentsOf: newGiphyItems)

                waitPaginationData = false
            } catch {
                waitPaginationData = false
                debugPrint("[a]: error \(error.localizedDescription)")
            }
        }
    }
}
