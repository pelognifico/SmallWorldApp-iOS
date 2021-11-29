//
//  DetailsMovieRouter.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 25/11/21.
//

import Foundation

@objc protocol DetailsMovieRoutingLogic {
}

protocol DetailsMovieDataPassing {
}

class DetailsMovieRouter: NSObject, DetailsMovieRoutingLogic, DetailsMovieDataPassing {
    weak var viewController: DetailsMovieViewController?
    var dataStore: DetailsMovieDataStore?
    
    // MARK: - Routing
    
    // MARK: - Navigation

}
