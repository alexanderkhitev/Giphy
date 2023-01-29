// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let fixedHeight = try? newJSONDecoder().decode(FixedHeight.self, from: jsonData)

import Foundation

// MARK: - FixedHeight
class FixedHeight: Codable {
    var height, width, size: String
    var url: String
    var mp4Size: String?
    var mp4: String?
    var webpSize: String
    var webp: String
    var frames, hash: String?

    enum CodingKeys: String, CodingKey {
        case height, width, size, url
        case mp4Size = "mp4_size"
        case mp4
        case webpSize = "webp_size"
        case webp, frames, hash
    }

    init(height: String, width: String, size: String, url: String, mp4Size: String?, mp4: String?, webpSize: String, webp: String, frames: String?, hash: String?) {
        self.height = height
        self.width = width
        self.size = size
        self.url = url
        self.mp4Size = mp4Size
        self.mp4 = mp4
        self.webpSize = webpSize
        self.webp = webp
        self.frames = frames
        self.hash = hash
    }
}
