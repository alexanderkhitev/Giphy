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
    @State private var isVisible = false

    var body: some View {
        content
            .onBecomingVisible {
                isVisible = true
            }
            .onBecomingInvisible {
                isVisible = false
            }
    }

    @ViewBuilder
    private var content: some View {
        if isVisible {
            let url = URL(string: giphyItem.preview.url)
            KFAnimatedImage(url)
                .configure { view in
                    view.framePreloadCount = 1
                }
                .placeholder { _ in
                    Color(forUUID: giphyItem.id)
                }
        } else {
            Color.clear
        }
    }
}
