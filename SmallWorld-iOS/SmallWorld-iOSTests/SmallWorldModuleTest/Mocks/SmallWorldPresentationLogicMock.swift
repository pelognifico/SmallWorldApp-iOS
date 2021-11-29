//
//  SmallWorldPresentationLogicMock.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import Foundation
@testable import SmallWorld_iOS

final class SmallWorldPresentationLogicMock: HomePresentationLogic {
    var responseMovies: HomeModel.MoviesList.Response?
    var isFunctionWasCalled = false
    
    func presentMovies(response: HomeModel.MoviesList.Response) {
        if responseMovies != nil {
            isFunctionWasCalled = true
        }
    }
    
    func presentError(response: Main.Error.Response) {
        isFunctionWasCalled = true
    }
}
