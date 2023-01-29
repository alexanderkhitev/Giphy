// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let onclick = try? newJSONDecoder().decode(Onclick.self, from: jsonData)

import Foundation

// MARK: - Onclick
class Onclick: Codable {
    var url: String

    init(url: String) {
        self.url = url
    }
}
