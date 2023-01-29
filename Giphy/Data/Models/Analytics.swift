// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let analytics = try? newJSONDecoder().decode(Analytics.self, from: jsonData)

import Foundation

// MARK: - Analytics
class Analytics: Codable {
    var onload, onclick, onsent: Onclick

    init(onload: Onclick, onclick: Onclick, onsent: Onclick) {
        self.onload = onload
        self.onclick = onclick
        self.onsent = onsent
    }
}
