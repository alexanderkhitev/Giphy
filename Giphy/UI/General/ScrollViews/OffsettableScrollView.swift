//
//  OffsettableScrollView.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

struct OffsettableScrollView<T: View>: View {
    let axes: Axis.Set
    let showsIndicator: Bool
    let mainScreenGeometryProxy: GeometryProxy
    let content: T
    @State private var contentSize: CGSize = .zero

    private enum Const {
        static var scrollOffsetPreferenceName: String {
            "ScrollViewOrigin"
        }
    }

    init(axes: Axis.Set = .vertical,
         showsIndicator: Bool = true,
         mainScreenGeometryProxy: GeometryProxy,
         @ViewBuilder content: () -> T) {
        self.axes = axes
        self.showsIndicator = showsIndicator
        self.mainScreenGeometryProxy = mainScreenGeometryProxy
        self.content = content()
    }

    var body: some View {
        ScrollView(axes, showsIndicators: showsIndicator) {
            VStack(spacing: 0) {
                offsetDetectorView
                contentView
            }
        }
        .coordinateSpace(name: Const.scrollOffsetPreferenceName)
        .onPreferenceChange(OffsetPreferenceKey.self,
                            perform: offsetChanged)
    }

    private var offsetDetectorView: some View {
        GeometryReader { proxy in
            Rectangle().preference(
                key: OffsetPreferenceKey.self,
                value: proxy.frame(in: .named(Const.scrollOffsetPreferenceName)).origin
            )
        }
        .frame(height: 0)
    }

    private var contentView: some View {
        content
            .readSize { size in
                contentSize = size
                debugPrint("[a]: contentScroll size \(size)")
            }
    }

    private func offsetChanged(_ offset: CGPoint) {
        let value = (abs(offset.y) +  mainScreenGeometryProxy.size.height).rounded()
        let isReachedBottom = value >= contentSize.height.rounded()
        debugPrint("isReachedBottom \(isReachedBottom)")
    }
}
