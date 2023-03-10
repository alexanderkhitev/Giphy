//
//  GiphyApp.swift
//  Giphy
//
//  Created by Alexander Khitev on 1/28/23.
//

import Kingfisher
import SwiftUI

@main
struct GiphyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            AppNavigationStack(coordinator: GiphyCoordinator())
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        KingfisherManager.shared.cache.memoryStorage.config.totalCostLimit = 200 * 1024 * 1024

        return true
    }
}
