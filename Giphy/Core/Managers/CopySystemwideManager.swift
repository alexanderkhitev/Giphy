//
//  CopySystemwideManager.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/29/23.
//

import UIKit

class CopySystemwideManager {

    private init() { }

    class func copy(_ url: URL) {
        UIPasteboard.general.url = url
    }

}
