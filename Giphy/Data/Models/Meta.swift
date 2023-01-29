// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let meta = try? newJSONDecoder().decode(Meta.self, from: jsonData)

import Foundation

// MARK: - Meta
class Meta: Codable {
    var status: Int
    var msg, responseID: String

    enum CodingKeys: String, CodingKey {
        case status, msg
        case responseID = "response_id"
    }

    init(status: Int, msg: String, responseID: String) {
        self.status = status
        self.msg = msg
        self.responseID = responseID
    }
}
