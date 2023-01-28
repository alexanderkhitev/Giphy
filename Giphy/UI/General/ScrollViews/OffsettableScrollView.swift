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
    let onOffsetChanged: (CGPoint) -> Void
    private var scrollDismissesKeyboardMode: Binding<ScrollDismissesKeyboardMode>
    let content: T

    private enum Const {
        static var scrollOffsetPreferenceName: String {
            "ScrollViewOrigin"
        }
    }

    init(axes: Axis.Set = .vertical,
         showsIndicator: Bool = true,
         scrollDismissesKeyboardMode: Binding<ScrollDismissesKeyboardMode> = .constant(.automatic),
         onOffsetChanged: @escaping (CGPoint) -> Void = { _ in },
         @ViewBuilder content: () -> T) {
        self.axes = axes
        self.showsIndicator = showsIndicator
        self.scrollDismissesKeyboardMode = scrollDismissesKeyboardMode
        self.onOffsetChanged = onOffsetChanged
        self.content = content()
    }

    var body: some View {
        ScrollView(axes, showsIndicators: showsIndicator) {
            VStack(spacing: 0) {
                GeometryReader { proxy in
                    Rectangle().preference(
                        key: OffsetPreferenceKey.self,
                        value: proxy.frame(in: .named(Const.scrollOffsetPreferenceName)).origin
                    )
                }
                .frame(height: 0)
                content
            }
        }
        .coordinateSpace(name: Const.scrollOffsetPreferenceName)
        .onPreferenceChange(OffsetPreferenceKey.self,
                            perform: onOffsetChanged)
        .scrollDismissesKeyboard(scrollDismissesKeyboardMode.wrappedValue)
    }

}

struct OffsettableScrollView_Previews: PreviewProvider {
    static var previews: some View {
        OffsettableScrollView {
            GeometryReader { proxy in
                Text("Hello")
                    .frame(width: proxy.size.width, height: 300)
                    .background(.red)
            }
        }
    }
}
