//
//  GiphyDetailedScreenViewModel.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/29/23.
//

import Foundation
import Kingfisher
import UniformTypeIdentifiers
import UIKit

class GiphyDetailedScreenViewModel: ObservableObject {
    @Published var saveButtonDisabled = false
    let giphyItem: GiphyItem
    private weak var coordinator: GiphyCoordinator?
    private lazy var photoManager = PhotoManager()

    init(giphyItem: GiphyItem, coordinator: GiphyCoordinator?) {
        self.giphyItem = giphyItem
        self.coordinator = coordinator
    }
}

// MARK: - Progress

extension GiphyDetailedScreenViewModel {
    func observeProgress(_ receivedSize: Int64, totalSize: Int64) {
        let isFinished = receivedSize == totalSize
        saveButtonDisabled = !isFinished
    }
}

extension GiphyDetailedScreenViewModel {
    func copyURL() {
        guard let url = URL(string: giphyItem.detailed.url) else { return }
        CopySystemwideManager.copy(url)
    }

    @MainActor
    func saveToPhotos() {
        guard let key = URL(string: giphyItem.detailed.url)?.absoluteString else { return }
        let sourceURL = ImageCache.default.diskStorage.cacheFileURL(forKey: key)

        Task {
            do {
                try await photoManager.saveImage(from: sourceURL)
            } catch {
                // show error
                debugPrint("\(#function), \(error)")
            }
        }
    }
}
