//
//  ClientSignUpContract.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import Foundation

// MARK: - View Input (Presenter -> View)
protocol PresenterToViewClientSignUpProtocol: ErrorAlertProtocol {
   
}

// MARK: - View Output/Presenter Input (View -> Presenter)
protocol ViewToPresenterClientSignUpProtocol {
    
    var view: PresenterToViewClientSignUpProtocol? { get set }
    var interactor: PresenterToInteractorClientSignUpProtocol? { get set }
    var router: PresenterToRouterClientSignUpProtocol? { get set }
    
    func load()
    func handleSignUpTap(
        fullName: String,
        username: String,
        password: String,
        repeatedPassword: String,
        email: String
    )
}

// MARK: - Interactor Input/Presenter Output (Presenter -> Interactor)
protocol PresenterToInteractorClientSignUpProtocol {
    
    var presenter: InteractorToPresenterClientSignUpProtocol? { get set }
    
    func signUp(signUpEntity: SignUpEntity)
}

// MARK: - Interactor Output/Presenter Input (Interactor -> Presenter)
protocol InteractorToPresenterClientSignUpProtocol {
    
}

// MARK: - Router Input (Presenter -> Router)
protocol PresenterToRouterClientSignUpProtocol {
    
}
