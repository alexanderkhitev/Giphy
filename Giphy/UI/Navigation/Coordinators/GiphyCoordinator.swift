//
//  GiphyCoordinator.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

class GiphyCoordinator: Coordinator {
    typealias Route = GiphyRoute
    typealias RootView = GiphyScreenView

    @Published var path = NavigationPath()

    func start() -> GiphyScreenView {
        GiphyScreenView(viewModel: .init(coordinator: self))
    }

    func push(_ route: GiphyRoute) {
        path.append(route)
    }

    func navigationDestination(for route: GiphyRoute) -> some View {
        EmptyView()
    }

}
