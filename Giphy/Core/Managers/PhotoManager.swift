//
//  PhotoManager.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/29/23.
//

import Photos

class PhotoManager {
    func saveImage(from sourceURL: URL) async throws {
        let tempURL = FileManager.default.temporaryDirectory.appendingPathComponent("\(UUID().uuidString).gif")
        try FileManager.default.copyItem(at: sourceURL, to: tempURL)

        try await PHPhotoLibrary.shared().performChanges {
            PHAssetChangeRequest.creationRequestForAssetFromImage(atFileURL: tempURL)
        }
    }
}
