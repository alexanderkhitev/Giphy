//
//  OffsetPreferenceKey.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

struct OffsetPreferenceKey: PreferenceKey {

    static var defaultValue: CGPoint = .zero

    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) { }

}
