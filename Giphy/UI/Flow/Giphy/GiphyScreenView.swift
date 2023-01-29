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

    enum Parameters {
        static let spacing: CGFloat = 8
        static let columnsNumber = 2
    }

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
        GiphyWaterfallGrid(viewModel: viewModel, spacing: Parameters.spacing)
    }

}

struct GiphyScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GiphyScreenView(viewModel: .init(coordinator: nil))
    }
}
