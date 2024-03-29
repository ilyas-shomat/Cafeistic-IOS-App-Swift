//
//  ClientSignUpViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 30.04.2021.
//  
//

import UIKit

class ClientSignUpViewController: UIViewController {
    
    private lazy var signUpLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appOrange
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = StringConstant.Scenes.ClienSignUp.accountSignUp
        return label
    }()
    
    private lazy var fullNameTextField: AppTextField = {
        let textField = AppTextField(style: .regular)
        textField.placeholder = StringConstant.Scenes.ClienSignUp.fullName
        return textField
    }()
    
    private lazy var loginTextField: AppTextField = {
        let textField = AppTextField(style: .login)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailTextField: AppTextField = {
        let textField = AppTextField(style: .email)
        textField.placeholder = StringConstant.Scenes.ClienSignUp.email
        return textField
    }()
    
    private lazy var passwordTextField: AppTextField = {
        let textField = AppTextField(style: .password)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var repeatedPasswordTextField: AppTextField = {
        let textField = AppTextField(style: .password)
        textField.placeholder = StringConstant.Scenes.ClienSignUp.repeatPassword
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var signUpButton: AppButton = {
        let button = AppButton(style: .rounded)
        button.setTitle(StringConstant.Scenes.ClienSignUp.signUp, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(
            self,
            action: #selector(tapSignUpButton),
            for: .touchUpInside
        )
        return button
    }()
    
    var presenter: ViewToPresenterClientSignUpProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
    }
}

extension ClientSignUpViewController: SetupBaseViewController {
    func setupViews() {
        configureSubViews()
        configureConstraints()
    }
    
    func configureSubViews() {
        view.addSubviews(
            signUpLabel,
            fullNameTextField,
            loginTextField,
            emailTextField,
            passwordTextField,
            repeatedPasswordTextField,
            signUpButton
        )
    }
    
    func configureConstraints() {
        signUpLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.width.equalToSuperview().multipliedBy(0.85)
            $0.centerX.equalToSuperview()
        }
        fullNameTextField.snp.makeConstraints {
            $0.top.equalTo(signUpLabel.snp.bottom).inset(-20)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.85)
            $0.height.equalTo(45)
        }
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(fullNameTextField.snp.bottom).inset(-10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(fullNameTextField)
            $0.height.equalTo(45)
        }
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).inset(-10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(fullNameTextField)
            $0.height.equalTo(45)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).inset(-10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(fullNameTextField)
            $0.height.equalTo(45)
        }
        repeatedPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).inset(-10)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(fullNameTextField)
            $0.height.equalTo(45)
        }
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(repeatedPasswordTextField.snp.bottom).inset(-15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(fullNameTextField)
            $0.height.equalTo(45)
        }
    }
    
    @objc private func tapSignUpButton() {
        presenter?.handleSignUpTap(
            fullName: fullNameTextField.text ?? "",
            username: loginTextField.text ?? "",
            password: passwordTextField.text ?? "",
            repeatedPassword: repeatedPasswordTextField.text ?? "",
            email: emailTextField.text ?? ""
        )
    }
}

// MARK: - (Presenter -> View)
//extension ClientSignUpViewController: PresenterToViewClientSignUpProtocol {
//
//}
