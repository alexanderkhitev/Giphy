// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let looping = try? newJSONDecoder().decode(Looping.self, from: jsonData)

import Foundation

// MARK: - Looping
class Looping: Codable {
    var mp4Size: String
    var mp4: String

    enum CodingKeys: String, CodingKey {
        case mp4Size = "mp4_size"
        case mp4
    }

    init(mp4Size: String, mp4: String) {
        self.mp4Size = mp4Size
        self.mp4 = mp4
    }
}
