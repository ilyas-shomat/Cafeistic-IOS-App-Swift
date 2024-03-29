//
//  StringConstant.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//

import Foundation

struct StringConstant {
    struct Scenes {
        struct SignIn {
            static let login = "Логин"
            static let password = "Пароль"
            static let signIn = "Войти"
            static let forgetPassword = "Забыли пароль?"
            static let notSignUpYet = "Еще не зарегистрированы?"
            static let signUp = "Зарегистрироваться"
            static let selectAccountType = "Выберите тип аккаунта"
            static let guest = "Пользователь"
            static let establishment = "Заведения"
        }
        
        struct ForgetPassword {
            static let enterEmail = "Введите почту"
            static let send = "Отправить"
        }
        
        struct ClienSignUp {
            static let accountSignUp = "Регистрация пользователя"
            static let fullName = "Полное имя"
            static let login = SignIn.login
            static let email = "Почта"
            static let password = SignIn.password
            static let repeatPassword = "Повторите пароль"
            static let signUp = SignIn.signUp
        }
        
        struct EstablishmentSignUp {
            static let staff = "Персонал"
            static let owner = "Владелец"
            static let staffSignUp = "Регистрация персонала"
            static let establishmentSignUp = "Регистрация заведения"
            static let ownerSignUp = "Регистрация владельца"
            static let fullName = ClienSignUp.fullName
            static let login = SignIn.login
            static let establismentId = "ID номер заведения"
            static let email = ClienSignUp.email
            static let password = SignIn.password
            static let repeatPassword = ClienSignUp.repeatPassword
            static let signUp = SignIn.signUp
            static let next = "Дальше"
            static let establishmentName = "Название заведения"
            static let establismentCity = "Город заведения"
            static let establismentPhone = "Контактный номер заведения"
            static let establisnetEmail = "Почта заведения (необьязательно)"
        }
        
        struct Menu {
            static let menu = "Меню"
        }
        
        struct ClientCurrentOrder {
            static let order = "Заказ #"
            static let total = "Итого"
            static let acceptReceiving = "Подвердить получение"
        }
        
        struct ClientOrderHistory {
            static let orderHistory = "История заказов"
            static let detail = "Подробнее"
        }
        
        struct Profile {
            static let profile = "Профиль"
            static let editUserInfo = "Редактировать данные"
            static let changePassword = "Сменить пароль"
        }
    }
    
    struct Services {
        struct ErrorMessage {
            static let notFount = "Страница не найдена"
            static let unknowedError = "Неизвестная ошибка"
            static let networkFail = "Проверьте интернет соединение"
            static let notAuthorized = "Пользователь не авторизован"
            static let notDecodable = "Данные не сериализуются (ошибка в Codable)"
            static let requestDataIsNotValid = "Отправленные данные не валидные"
        }
        
        struct AlertMessage {
            static let error = "Ошибка"
            static let ok = "ОК"
            static let passwordsNotEqual = "Пароли не совпадают"
            static let someEmptyFieldsExist = "Некоторые данные не введены"
            static let someFieldsFilledWrong = "Некоторые данные введены не правильно"
        }
    }
}
