//
//  LoginSceneBuilder.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//  
//

import UIKit

class LoginScene {
    
    static func initiate() -> UIViewController {
        let viewController = LoginViewController()
        let presenter: ViewToPresenterLoginProtocol & InteractorToPresenterLoginProtocol = LoginPresenter()
        
        let networkApiSerive = serloc.getService(Networkable.self)
            
        viewController.presenter = presenter
        viewController.presenter?.router = LoginRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = LoginInteractor(networkApiService: networkApiSerive)
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
