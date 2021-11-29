//
//  GeneralRoute.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 23/11/21.
//

import Foundation
import UIKit

enum GeneralRoute: IRouter {
    case main
    case home
}

extension GeneralRoute {
    var scene: UIViewController? {
        switch self {
        case .main:
            return MainViewController()
        case .home:
            return HomeViewController()
        }
    }
}
