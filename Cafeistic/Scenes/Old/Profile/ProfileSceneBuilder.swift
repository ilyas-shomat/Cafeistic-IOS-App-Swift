//
//  ProfileSceneBuilder.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.05.2021.
//  
//

import UIKit
//import Light
import LiteNet

class ProfileScene {
    
    static func initiate() -> UIViewController {
        let viewController = ProfileViewController()
        
        let presenter: ViewToPresenterProfileProtocol & InteractorToPresenterProfileProtocol = ProfilePresenter()
        
        let networkApiSerive = AppInitializer.serloc.getService(LiteNetProtocol.self)
        let sessionTracker = AppInitializer.serloc.getService(SessionTracker.self)
        
        viewController.presenter = presenter
        viewController.presenter?.router = ProfileRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ProfileInteractor(networkApiService: networkApiSerive, sessionTracker: sessionTracker)
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
