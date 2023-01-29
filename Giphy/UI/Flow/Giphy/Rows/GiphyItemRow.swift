//
//  GiphyItemRow.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import Kingfisher
import SwiftUI

struct GiphyItemRow: View {

    let giphyItem: GiphyItem
    let placeholder: Color

    init(giphyItem: GiphyItem) {
        self.giphyItem = giphyItem
        self.placeholder = Color(forUUID: giphyItem.id)
    }

    var body: some View {
        content
    }

    @ViewBuilder
    private var content: some View {
        let url = URL(string: giphyItem.preview.url)
        KFAnimatedImage(url)
            .configure { view in
                view.framePreloadCount = 0
                view.backgroundDecode = true
            }
            .placeholder { _ in
                placeholder
            }
            .cancelOnDisappear(true)
    }

}
