// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
class GiphyData: Codable {
    var data: [GiphyItem]
    var pagination: Pagination
    var meta: Meta

    init(data: [GiphyItem], pagination: Pagination, meta: Meta) {
        self.data = data
        self.pagination = pagination
        self.meta = meta
    }
}
