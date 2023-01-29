//
//  GiphyScreenView.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

struct GiphyScreenView: View {
    @StateObject var viewModel: GiphyScreenViewModel
    @State private var contentGeoProxy: GeometryProxy?

    var body: some View {
        content
            .navigationTitle("Giphy")
            .navigationBarTitleDisplayMode(.inline)
            .onFirstAppear {
                viewModel.loadData()
            }
    }

    @ViewBuilder
    private var content: some View {
        GeometryReader { geoProxy in
            OffsettableScrollView(axes: .vertical, mainScreenGeometryProxy: geoProxy) { isReachedBoottom in
                guard isReachedBoottom else { return }
                viewModel.loadPaginatonData()
            } content: {
                grid
            }
            .onAppear {
                viewModel.mainScreenGeoProxy = geoProxy
                contentGeoProxy = geoProxy
            }
        }
    }

    @ViewBuilder
    private var grid: some View {
        let spacing: CGFloat = 8
        GiphyWaterfallGrid(viewModel: viewModel, spacing: spacing)
    }

}

struct GiphyScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GiphyScreenView(viewModel: .init(coordinator: nil))
    }
}
