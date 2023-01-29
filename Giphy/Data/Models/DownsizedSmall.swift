// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let downsizedSmall = try? newJSONDecoder().decode(DownsizedSmall.self, from: jsonData)

import Foundation

// MARK: - DownsizedSmall
class DownsizedSmall: Codable {
    var height, width, mp4Size: String
    var mp4: String

    enum CodingKeys: String, CodingKey {
        case height, width
        case mp4Size = "mp4_size"
        case mp4
    }

    init(height: String, width: String, mp4Size: String, mp4: String) {
        self.height = height
        self.width = width
        self.mp4Size = mp4Size
        self.mp4 = mp4
    }
}
