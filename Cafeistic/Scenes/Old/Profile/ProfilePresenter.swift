//
//  ProfilePresenter.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 28.05.2021.
//  
//

import Foundation

// MARK: - (View -> Presenter)
class ProfilePresenter: ViewToPresenterProfileProtocol {

    var view: PresenterToViewProfileProtocol?
    var interactor: PresenterToInteractorProfileProtocol?
    var router: PresenterToRouterProfileProtocol?
    
    func load() {
        
    }
    
    func handleLogoutTap() {
        interactor?.logout()
        router?.showLoginScene(on: view!)
    }
}

// MARK: - (Interactor -> Presenter)
extension ProfilePresenter: InteractorToPresenterProfileProtocol {
    
}
