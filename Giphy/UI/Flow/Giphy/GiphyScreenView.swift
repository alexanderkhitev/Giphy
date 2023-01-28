//
//  GiphyScreenView.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import WaterfallGrid
import SwiftUI

struct GiphyScreenView: View {
    @StateObject var viewModel: GiphyScreenViewModel
    @State private var contentGeoProxy: GeometryProxy?

    var body: some View {
        content
            .navigationTitle("Giphy")
            .navigationBarTitleDisplayMode(.large)
            .onFirstAppear {
                viewModel.loadData()
            }
    }

    @ViewBuilder
    private var content: some View {
        GeometryReader { geoProxy in
            OffsettableScrollView(axes: .vertical, mainScreenGeometryProxy: geoProxy) {
                grid
            }
            .onAppear {
                contentGeoProxy = geoProxy
            }
        }
    }

    @ViewBuilder
    private var grid: some View {
        let spacing: CGFloat = 8
        WaterfallGrid(viewModel.giphyItems) { giphyItem in
            row(giphyItem, spacing: spacing)
                .id(giphyItem.id)
        }
        .gridStyle(columns: 2, spacing: spacing)
    }

    @ViewBuilder
    private func row(_ giphyItem: GiphyItem, spacing: CGFloat) -> some View {
        let size = calculateRowSize(giphyItem, spacing: spacing)
        GiphyItemRow(giphyItem: giphyItem)
            .frame(width: size.width, height: size.height)
    }

    private func calculateRowSize(_ giphyItem: GiphyItem, spacing: CGFloat) -> CGSize {
        let screenSize = contentGeoProxy?.size ?? .zero
        let rowWidth = (screenSize.width - spacing) / 2

        let width = CGFloat(Int(giphyItem.images.preview.width) ?? 0)
        let height = CGFloat(Int(giphyItem.images.preview.height) ?? 0)

        let multipler = height / width

        let rowHeight = rowWidth * multipler

        return CGSize(width: rowWidth, height: rowHeight)
    }

}

struct GiphyScreenView_Previews: PreviewProvider {
    static var previews: some View {
        GiphyScreenView(viewModel: .init(coordinator: nil))
    }
}
