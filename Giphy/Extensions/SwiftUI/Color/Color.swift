//
//  Color.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

extension Color {
    init(forUUID uuid: String) {
        let hash = uuid.hash
        let colorCode = abs(hash) % 0x1000000
        let red = colorCode >> 16
        let green = (colorCode >> 8) & 0xff
        let blue = colorCode & 0xff
        let uiColor = UIColor(red: CGFloat(red) / 256, green: CGFloat(green) / 256, blue: CGFloat(blue) / 256, alpha: 1)
        self.init(uiColor: uiColor)
    }
}
