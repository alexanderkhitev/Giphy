//
//  GiphyData.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import Foundation

struct GiphyData: Codable {
    var data: [GiphyItem]
    var pagination: Pagination
    var meta: Meta

    init(data: [GiphyItem], pagination: Pagination, meta: Meta) {
        self.data = data
        self.pagination = pagination
        self.meta = meta
    }
}

// MARK: - Datum
struct GiphyItem: Codable, Identifiable, Hashable {
    let type: GiphyItemType
    let id: String
    let url: String
    let slug: String
    let bitlyGIFURL, bitlyURL: String
    let embedURL: String
    let username: String
    let source: String
    let title: String
    let rating: Rating
    let contentURL, sourceTLD: String
    let sourcePostURL: String
    let isSticker: Int
    let importDatetime, trendingDatetime: String
    let images: Images
    let user: User?
    let analyticsResponsePayload: String
    let analytics: Analytics

    var preview: The480_WStill {
        images.downsized
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

    init(type: GiphyItemType, id: String, url: String, slug: String, bitlyGIFURL: String, bitlyURL: String, embedURL: String, username: String, source: String, title: String, rating: Rating, contentURL: String, sourceTLD: String, sourcePostURL: String, isSticker: Int, importDatetime: String, trendingDatetime: String, images: Images, user: User?, analyticsResponsePayload: String, analytics: Analytics) {
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

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Analytics
struct Analytics: Codable {
    let onload, onclick, onsent: Onclick

    init(onload: Onclick, onclick: Onclick, onsent: Onclick) {
        self.onload = onload
        self.onclick = onclick
        self.onsent = onsent
    }
}

// MARK: - Onclick
struct Onclick: Codable {
    let url: String

    init(url: String) {
        self.url = url
    }
}

// MARK: - Images
struct Images: Codable {
    let original: FixedHeight
    let downsized, downsizedLarge, downsizedMedium: The480_WStill
    let downsizedSmall: The4_K
    let downsizedStill: The480_WStill
    let fixedHeight, fixedHeightDownsampled, fixedHeightSmall: FixedHeight
    let fixedHeightSmallStill, fixedHeightStill: The480_WStill
    let fixedWidth, fixedWidthDownsampled, fixedWidthSmall: FixedHeight
    let fixedWidthSmallStill, fixedWidthStill: The480_WStill
    let looping: Looping
    let originalStill: The480_WStill
    let originalMp4, preview: The4_K
    let previewGIF, previewWebp: The480_WStill
    let hd: The4_K?
    let the480WStill: The480_WStill
    let the4K: The4_K?

    enum CodingKeys: String, CodingKey {
        case original, downsized
        case downsizedLarge = "downsized_large"
        case downsizedMedium = "downsized_medium"
        case downsizedSmall = "downsized_small"
        case downsizedStill = "downsized_still"
        case fixedHeight = "fixed_height"
        case fixedHeightDownsampled = "fixed_height_downsampled"
        case fixedHeightSmall = "fixed_height_small"
        case fixedHeightSmallStill = "fixed_height_small_still"
        case fixedHeightStill = "fixed_height_still"
        case fixedWidth = "fixed_width"
        case fixedWidthDownsampled = "fixed_width_downsampled"
        case fixedWidthSmall = "fixed_width_small"
        case fixedWidthSmallStill = "fixed_width_small_still"
        case fixedWidthStill = "fixed_width_still"
        case looping
        case originalStill = "original_still"
        case originalMp4 = "original_mp4"
        case preview
        case previewGIF = "preview_gif"
        case previewWebp = "preview_webp"
        case hd
        case the480WStill = "480w_still"
        case the4K = "4k"
    }

    init(original: FixedHeight, downsized: The480_WStill, downsizedLarge: The480_WStill, downsizedMedium: The480_WStill, downsizedSmall: The4_K, downsizedStill: The480_WStill, fixedHeight: FixedHeight, fixedHeightDownsampled: FixedHeight, fixedHeightSmall: FixedHeight, fixedHeightSmallStill: The480_WStill, fixedHeightStill: The480_WStill, fixedWidth: FixedHeight, fixedWidthDownsampled: FixedHeight, fixedWidthSmall: FixedHeight, fixedWidthSmallStill: The480_WStill, fixedWidthStill: The480_WStill, looping: Looping, originalStill: The480_WStill, originalMp4: The4_K, preview: The4_K, previewGIF: The480_WStill, previewWebp: The480_WStill, hd: The4_K?, the480WStill: The480_WStill, the4K: The4_K?) {
        self.original = original
        self.downsized = downsized
        self.downsizedLarge = downsizedLarge
        self.downsizedMedium = downsizedMedium
        self.downsizedSmall = downsizedSmall
        self.downsizedStill = downsizedStill
        self.fixedHeight = fixedHeight
        self.fixedHeightDownsampled = fixedHeightDownsampled
        self.fixedHeightSmall = fixedHeightSmall
        self.fixedHeightSmallStill = fixedHeightSmallStill
        self.fixedHeightStill = fixedHeightStill
        self.fixedWidth = fixedWidth
        self.fixedWidthDownsampled = fixedWidthDownsampled
        self.fixedWidthSmall = fixedWidthSmall
        self.fixedWidthSmallStill = fixedWidthSmallStill
        self.fixedWidthStill = fixedWidthStill
        self.looping = looping
        self.originalStill = originalStill
        self.originalMp4 = originalMp4
        self.preview = preview
        self.previewGIF = previewGIF
        self.previewWebp = previewWebp
        self.hd = hd
        self.the480WStill = the480WStill
        self.the4K = the4K
    }
}

// MARK: - The480_WStill
struct The480_WStill: Codable {
    let height, width, size: String
    let url: String

    init(height: String, width: String, size: String, url: String) {
        self.height = height
        self.width = width
        self.size = size
        self.url = url
    }
}

// MARK: - The4_K
struct The4_K: Codable {
    let height, width, mp4Size: String
    let mp4: String

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

// MARK: - FixedHeight
struct FixedHeight: Codable {
    let height, width, size: String
    let url: String
    let mp4Size: String?
    let mp4: String?
    let webpSize: String
    let webp: String
    let frames, hash: String?

    enum CodingKeys: String, CodingKey {
        case height, width, size, url
        case mp4Size = "mp4_size"
        case mp4
        case webpSize = "webp_size"
        case webp, frames, hash
    }

    init(height: String, width: String, size: String, url: String, mp4Size: String?, mp4: String?, webpSize: String, webp: String, frames: String?, hash: String?) {
        self.height = height
        self.width = width
        self.size = size
        self.url = url
        self.mp4Size = mp4Size
        self.mp4 = mp4
        self.webpSize = webpSize
        self.webp = webp
        self.frames = frames
        self.hash = hash
    }
}

// MARK: - Looping
struct Looping: Codable {
    let mp4Size: String
    let mp4: String

    enum CodingKeys: String, CodingKey {
        case mp4Size = "mp4_size"
        case mp4
    }

    init(mp4Size: String, mp4: String) {
        self.mp4Size = mp4Size
        self.mp4 = mp4
    }
}

enum Rating: String, Codable {
    case g
    case pg
    case pg13 = "pg-13"
    case r
}

enum GiphyItemType: String, Codable {
    case gif
}

// MARK: - User
struct User: Codable {
    let avatarURL: String
    let bannerImage, bannerURL: String
    let profileURL: String
    let username, displayName, description: String
    let instagramURL: String
    let websiteURL: String
    let isVerified: Bool

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

// MARK: - Meta
struct Meta: Codable {
    let status: Int
    let msg, responseID: String

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

// MARK: - Pagination
struct Pagination: Codable {
    let totalCount, count, offset: Int

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
