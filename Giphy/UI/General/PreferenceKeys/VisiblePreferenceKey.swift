//
//  VisibleKey.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

struct VisiblePreferenceKey: PreferenceKey {
    static var defaultValue = false
    static func reduce(value: inout Bool, nextValue: () -> Bool) { }
}
