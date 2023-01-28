//
//  AppNavigationStack.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

struct AppNavigationStack<ContentCoordinator: Coordinator>: View {
    @StateObject private var coordinator: ContentCoordinator

    init(coordinator: @autoclosure @escaping () -> ContentCoordinator) {
        _coordinator = StateObject(wrappedValue: coordinator())
    }

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            rootView
                .navigationDestination(for: ContentCoordinator.Route.self) { route in
                    coordinator.navigationDestination(for: route)
                        .id(route)
                }
        }
    }

    private var rootView: some View {
        coordinator.start()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

