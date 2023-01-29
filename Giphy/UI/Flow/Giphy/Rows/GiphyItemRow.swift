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
    @State private var isVisible = false

    init(giphyItem: GiphyItem) {
        self.giphyItem = giphyItem
        self.placeholder = Color(forUUID: giphyItem.id)
    }

    var body: some View {
        content
            .onAppear {
                isVisible = true
            }
            .onDisappear {
                isVisible = false
            }
    }

    @ViewBuilder
    private var content: some View {
        if isVisible {
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
        } else {
            placeholder
        }
    }

}
