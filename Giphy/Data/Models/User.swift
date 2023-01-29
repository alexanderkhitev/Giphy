// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let user = try? newJSONDecoder().decode(User.self, from: jsonData)

import Foundation

// MARK: - User
class User: Codable {
    var avatarURL: String
    var bannerImage, bannerURL: String
    var profileURL: String
    var username, displayName, description: String
    var instagramURL, websiteURL: String
    var isVerified: Bool

    enum CodingKeys: String, CodingKey {
        case avatarURL = "avatar_url"
        case bannerImage = "banner_image"
        case bannerURL = "banner_url"
        case profileURL = "profile_url"
        case username
        case displayName = "display_name"
        case description
        case instagramURL = "instagram_url"
        case websiteURL = "website_url"
        case isVerified = "is_verified"
    }

    init(avatarURL: String, bannerImage: String, bannerURL: String, profileURL: String, username: String, displayName: String, description: String, instagramURL: String, websiteURL: String, isVerified: Bool) {
        self.avatarURL = avatarURL
        self.bannerImage = bannerImage
        self.bannerURL = bannerURL
        self.profileURL = profileURL
        self.username = username
        self.displayName = displayName
        self.description = description
        self.instagramURL = instagramURL
        self.websiteURL = websiteURL
        self.isVerified = isVerified
    }
}
