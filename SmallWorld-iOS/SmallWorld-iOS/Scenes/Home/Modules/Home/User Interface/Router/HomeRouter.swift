//
//  HomeRouter.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 25/11/21.
//

import Foundation
import UIKit

@objc protocol HomeRoutingLogic {
//    func routeToHardware()
}

protocol HomeDataPassing {
    var dataStore: HomeDataStore? { get }
}

protocol HomeRouterDelegate: AnyObject {
//    func displayHardwareScreen()
}

class HomeRouter: NSObject, HomeRoutingLogic, HomeDataPassing {
    weak var viewController: HomeViewController?
    var dataStore: HomeDataStore?
    weak var delegate: HomeRouterDelegate?
  
//    func routeToHardware() {
//        delegate?.displayHardwareScreen()
//    }
}
