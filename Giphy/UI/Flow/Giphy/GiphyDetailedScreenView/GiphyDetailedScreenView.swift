//
//  GiphyDetailedScreenView.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/29/23.
//

import Kingfisher
import SwiftUI

struct GiphyDetailedScreenView: View {
    @StateObject var viewModel: GiphyDetailedScreenViewModel

    var body: some View {
        VStack(spacing: 50) {
            KFAnimatedImage(URL(string: viewModel.giphyItem.detailed.url))
                .placeholder({ progress in
                    Text(progress.localizedDescription)
                        .font(.title2)
                })
                .scaledToFit()
            buttons
        }
    }

    private var buttons: some View {
        VStack(spacing: 20) {
            Button("Copy giphy url") {
                viewModel.copyURL()
            }
            Button("Save giphy") {

            }
        }
        .buttonStyle(.bordered)
        .font(.title)
    }
}

struct GiphyDetailedScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GiphyDetailedScreenView(viewModel: .init(giphyItem: Mock.giphyItem()!, coordinator: nil))
    }
}
