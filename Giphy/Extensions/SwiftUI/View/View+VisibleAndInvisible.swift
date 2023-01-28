//
//  View+VisibleAndInvisible.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

extension View {
    func onBecomingVisible(perform action: @escaping () -> Void) -> some View {
        modifier(BecomingVisible(action: action))
    }

    func onBecomingInvisible(perform action: @escaping () -> Void) -> some View {
        modifier(BecomingInvisible(action: action))
    }
}

private struct BecomingVisible: ViewModifier {

    @State var action: (() -> Void)?

    func body(content: Content) -> some View {
        content.overlay {
            GeometryReader { proxy in
                Color.clear
                    .preference(
                        key: VisiblePreferenceKey.self,
                        // TODO: - Alex See discussion!
                        value: UIScreen.main.bounds.intersects(proxy.frame(in: .global))
                    )
                    .onPreferenceChange(VisiblePreferenceKey.self) { isVisible in
                        guard isVisible else { return }
                        action?()
                    }
            }
        }
    }
}

private struct BecomingInvisible: ViewModifier {

    @State var action: (() -> Void)?

    func body(content: Content) -> some View {
        content.overlay {
            GeometryReader { proxy in
                Color.clear
                    .preference(
                        key: InvisiblePreferenceKey.self,
                        // TODO: - Alex See discussion!
                        value: !UIScreen.main.bounds.intersects(proxy.frame(in: .global))
                    )
                    .onPreferenceChange(InvisiblePreferenceKey.self) { isInvisible in
                        guard isInvisible else { return }
                        action?()
                    }
            }
        }
    }


}
