// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let datum = try? newJSONDecoder().decode(Datum.self, from: jsonData)

import Foundation

// MARK: - Datum
class GiphyItem: Codable, PrinterestGridItemProtocol {
    var type: TypeEnum
    var id: String
    var url: String
    var slug: String
    var bitlyGIFURL, bitlyURL: String
    var embedURL: String
    var username: String
    var source: String
    var title: String
    var rating: Rating
    var contentURL, sourceTLD: String
    var sourcePostURL: String
    var isSticker: Int
    var importDatetime, trendingDatetime: String
    var images: Images
    var user: User?
    var analyticsResponsePayload: String
    var analytics: Analytics

    // MARK: - Internal data
    var rowSize: CGSize = .zero
    let rowID = UUID()
    var preview: The480_WStill {
        images.downsized
    }
    var detailed: The480_WStill {
        images.downsizedLarge
    }

    enum CodingKeys: String, CodingKey {
        case type, id, url, slug
        case bitlyGIFURL = "bitly_gif_url"
        case bitlyURL = "bitly_url"
        case embedURL = "embed_url"
        case username, source, title, rating
        case contentURL = "content_url"
        case sourceTLD = "source_tld"
        case sourcePostURL = "source_post_url"
        case isSticker = "is_sticker"
        case importDatetime = "import_datetime"
        case trendingDatetime = "trending_datetime"
        case images, user
        case analyticsResponsePayload = "analytics_response_payload"
        case analytics
    }

    init(type: TypeEnum, id: String, url: String, slug: String, bitlyGIFURL: String, bitlyURL: String, embedURL: String, username: String, source: String, title: String, rating: Rating, contentURL: String, sourceTLD: String, sourcePostURL: String, isSticker: Int, importDatetime: String, trendingDatetime: String, images: Images, user: User?, analyticsResponsePayload: String, analytics: Analytics) {
        self.type = type
        self.id = id
        self.url = url
        self.slug = slug
        self.bitlyGIFURL = bitlyGIFURL
        self.bitlyURL = bitlyURL
        self.embedURL = embedURL
        self.username = username
        self.source = source
        self.title = title
        self.rating = rating
        self.contentURL = contentURL
        self.sourceTLD = sourceTLD
        self.sourcePostURL = sourcePostURL
        self.isSticker = isSticker
        self.importDatetime = importDatetime
        self.trendingDatetime = trendingDatetime
        self.images = images
        self.user = user
        self.analyticsResponsePayload = analyticsResponsePayload
        self.analytics = analytics
    }
}

extension GiphyItem: Equatable {
    static func == (lhs: GiphyItem, rhs: GiphyItem) -> Bool {
        lhs.id == rhs.id
    }
}

extension GiphyItem: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
