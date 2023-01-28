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
    let reachedBottomHandler: (Bool) -> Void
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
         reachedBottomHandler: @escaping (Bool) -> Void,
         @ViewBuilder content: () -> T) {
        self.axes = axes
        self.showsIndicator = showsIndicator
        self.mainScreenGeometryProxy = mainScreenGeometryProxy
        self.reachedBottomHandler = reachedBottomHandler
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
                debugPrint("[a]: scroll view readSize \(size)")
                contentSize = size
            }
    }

    private func offsetChanged(_ offset: CGPoint) {
        guard contentSize.height > 0 else { return }
        let value = (abs(offset.y) +  mainScreenGeometryProxy.size.height).rounded()
        let isReachedBottom = value >= contentSize.height.rounded()
        reachedBottomHandler(isReachedBottom)
    }
}
