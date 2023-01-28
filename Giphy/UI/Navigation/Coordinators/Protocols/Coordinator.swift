//
//  Coordinator.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import SwiftUI

@MainActor
protocol Coordinator: ObservableObject {
    associatedtype Route: Hashable
    associatedtype RootView: View
    associatedtype DestinationView: View
    var path: NavigationPath { get set }
    func start() -> RootView
    func push(_ route: Route)
    func navigationDestination(for route: Route) -> DestinationView
    func popToRoot()
}

extension Coordinator {
    func popToRoot() {
        path.removeLast(path.count)
    }
}
