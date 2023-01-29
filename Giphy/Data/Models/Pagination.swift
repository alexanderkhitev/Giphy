// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let pagination = try? newJSONDecoder().decode(Pagination.self, from: jsonData)

import Foundation

// MARK: - Pagination
class Pagination: Codable {
    var totalCount, count, offset: Int

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case count, offset
    }

    init(totalCount: Int, count: Int, offset: Int) {
        self.totalCount = totalCount
        self.count = count
        self.offset = offset
    }
}
