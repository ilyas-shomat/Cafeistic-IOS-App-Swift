//
//  LoginViewController.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//  
//

import UIKit
import SnapKit

class LoginViewController: DefaultViewController {
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = Assets.appLogo.image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var loginTextField: MaintextField = {
        let textField = MaintextField(style: .login)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = ViewAccessibilityIdentifier.Scenes.Login.loginTextField
        return textField
    }()
    
    private lazy var passwordTextField: MaintextField = {
        let textField = MaintextField(style: .password)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.accessibilityIdentifier = ViewAccessibilityIdentifier.Scenes.Login.passwordTextField
        return textField
    }()
    
    private lazy var signInButton: MainButton = {
        let button = MainButton(style: .rounded)
        button.setTitle(StringConstant.Scenes.Login.signIn, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var forgetPasswordButton: MainButton = {
        let button = MainButton(style: .clear)
        button.setTitle(StringConstant.Scenes.Login.forgetPassword, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var notSignUpYetLabel: UILabel = {
        let label = UILabel()
        label.text = StringConstant.Scenes.Login.notSignUpYet
        label.textColor = UIColor.appLightGray
        return label
    }()
    
    private lazy var signUpButton: MainButton = {
        let button = MainButton(style: .clear)
        button.setTitle(StringConstant.Scenes.Login.signUp, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var presenter: ViewToPresenterLoginProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.load()
        setupViews()
        setupActions()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       self.navigationController?.setNavigationBarHidden(true, animated: true)
   }

   override func viewWillDisappear(_ animated: Bool) {
       super.viewWillDisappear(animated)
       self.navigationController?.setNavigationBarHidden(false, animated:true)
   }
    
}

extension LoginViewController: SetupBaseViewController {
    
    func setupViews() {
        handleTopAlertButtonTap = {
            self.presenter?.handleAlertTopButtonTap()
        }
        handleBottomAlertButtonTap = {
            self.presenter?.handleAlertBottomButtonTap()
        }
        configureSubViews()
        configureConstraints()
    }
    
    func configureSubViews() {
        view.addSubviews(logoImageView,
                         loginTextField,
                         passwordTextField,
                         signInButton,
                         forgetPasswordButton,
                         signUpButton,
                         notSignUpYetLabel)
    }
    
    func configureConstraints() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(90)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(255)
            $0.height.equalTo(255)
        }
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).inset(-35)
            $0.height.equalTo(45)
            $0.width.equalToSuperview().multipliedBy(0.85)
            $0.centerX.equalToSuperview()
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).inset(-10)
            $0.height.equalTo(45)
            $0.width.equalTo(loginTextField)
            $0.centerX.equalToSuperview()
        }
        signInButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).inset(-15)
            $0.height.equalTo(45)
            $0.width.equalTo(loginTextField)
            $0.centerX.equalToSuperview()
        }
        forgetPasswordButton.snp.makeConstraints {
            $0.top.equalTo(signInButton.snp.bottom).inset(5)
            $0.height.equalTo(45)
            $0.width.equalTo(loginTextField)
            $0.centerX.equalToSuperview()
        }
        signUpButton.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(45)
            $0.width.equalTo(loginTextField)
            $0.centerX.equalToSuperview()
        }
        notSignUpYetLabel.snp.makeConstraints {
            $0.bottom.equalTo(signUpButton.snp.top).inset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setupActions() {
        signInButton.addTarget(self, action: #selector(tapSignInButton), for: .touchUpInside)
        forgetPasswordButton.addTarget(self, action: #selector(tapForgetPasswordButton), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
    }
    
    @objc private func tapSignInButton() {
        presenter?.handleSignInTap(username: loginTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    @objc private func tapForgetPasswordButton() {
        presenter?.handleForgetPasswordTap()
    }
    
    @objc private func tapSignUpButton() {
        showDefaultAlert(message: StringConstant.Scenes.Login.selectAccountType,
                         topButtonTitle: StringConstant.Scenes.Login.guest,
                         bottomButtonTitle: StringConstant.Scenes.Login.establishment)
//        presenter?.handleSignUpTap()
    }
}

// MARK: - (Presenter -> View)
extension LoginViewController: PresenterToViewLoginProtocol {
    
    func showErrorAlert(message: AlertMessageConstant) {
        showDefaultAlert(title: message.title,
                         message: message.message,
                         buttonTitle: message.buttonTitle)
    }
}
