// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let the480WStill = try? newJSONDecoder().decode(The480_WStill.self, from: jsonData)

import Foundation

// MARK: - The480_WStill
class The480_WStill: Codable {
    var height, width, size: String
    var url: String

    init(height: String, width: String, size: String, url: String) {
        self.height = height
        self.width = width
        self.size = size
        self.url = url
    }
}
