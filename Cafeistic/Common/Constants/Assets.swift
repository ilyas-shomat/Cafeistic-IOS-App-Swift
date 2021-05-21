//
//  Assets.swift
//  Cafeistic
//
//  Created by Ilyas Shomat on 26.04.2021.
//

import Foundation
import UIKit

internal enum Assets {
    case appLogo
    case visibilityOnIcon
    case visibilityOffIcon
    case orderCart
    case trash
    
    public var image: UIImage? {
        switch self {
        case .appLogo:
            return UIImage(named: "logo")
        case .visibilityOnIcon:
            return UIImage(named: "visibility_on_icon")
        case .visibilityOffIcon:
            return UIImage(named: "visibility_off_icon")
        case .orderCart:
            return UIImage(named: "order_cart")
        case .trash:
            return UIImage(named: "trash")
        }
    }
}
