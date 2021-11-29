//
//  MainRouter.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 23/11/21.
//

import Foundation

@objc protocol MainRoutingLogic {
}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

class MainRouter: NSObject, MainRoutingLogic, MainDataPassing {
    weak var viewController: MainViewController?
    var dataStore: MainDataStore?
  
}
