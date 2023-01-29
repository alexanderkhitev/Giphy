// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let images = try? newJSONDecoder().decode(Images.self, from: jsonData)

import Foundation

// MARK: - Images
class Images: Codable {
    var original: FixedHeight
    var downsized, downsizedLarge, downsizedMedium: The480_WStill
    var downsizedSmall: DownsizedSmall
    var downsizedStill: The480_WStill
    var fixedHeight, fixedHeightDownsampled, fixedHeightSmall: FixedHeight
    var fixedHeightSmallStill, fixedHeightStill: The480_WStill
    var fixedWidth, fixedWidthDownsampled, fixedWidthSmall: FixedHeight
    var fixedWidthSmallStill, fixedWidthStill: The480_WStill
    var looping: Looping
    var originalStill: The480_WStill
    var originalMp4, preview: DownsizedSmall
    var previewGIF, previewWebp: The480_WStill
    var hd: DownsizedSmall?
    var the480WStill: The480_WStill

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
    }

    init(original: FixedHeight, downsized: The480_WStill, downsizedLarge: The480_WStill, downsizedMedium: The480_WStill, downsizedSmall: DownsizedSmall, downsizedStill: The480_WStill, fixedHeight: FixedHeight, fixedHeightDownsampled: FixedHeight, fixedHeightSmall: FixedHeight, fixedHeightSmallStill: The480_WStill, fixedHeightStill: The480_WStill, fixedWidth: FixedHeight, fixedWidthDownsampled: FixedHeight, fixedWidthSmall: FixedHeight, fixedWidthSmallStill: The480_WStill, fixedWidthStill: The480_WStill, looping: Looping, originalStill: The480_WStill, originalMp4: DownsizedSmall, preview: DownsizedSmall, previewGIF: The480_WStill, previewWebp: The480_WStill, hd: DownsizedSmall?, the480WStill: The480_WStill) {
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
    }
}
