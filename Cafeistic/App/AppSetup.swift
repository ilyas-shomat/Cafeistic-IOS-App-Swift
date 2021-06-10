//
//  AppSetup.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 21.04.2021.
//

import Foundation
import UIKit
import IQKeyboardManagerSwift
import Moya


class AppSetup {
    
    public static let shared = AppSetup()
    
    var networkApiService: Networkable? {
        let provider = MoyaProvider<AnyTarget>(plugins: [NetworkLoggerPlugin()])
//        let provider = MoyaProvider<AnyTarget>()
        
        return NetworkApiService(provider: provider)
    }

    func setupRootScene(window: UIWindow) {
        window.rootViewController = BaseNavigationController(type: .regular)
        guard let rootNavgiationController = window.rootViewController as? UINavigationController else {
            fatalError("Root viewController must be inherited from UINavigationController")
        }
        rootNavgiationController.pushViewController(StartScene.initiate(), animated: false)
        window.makeKeyAndVisible()
    }
    
    func setupSerivces() {
        let registry = LazyServiceLocator()
        serloc = registry
        
        IQKeyboardManager.shared.enable = true

        registry.addService(networkApiService)
    }
}
