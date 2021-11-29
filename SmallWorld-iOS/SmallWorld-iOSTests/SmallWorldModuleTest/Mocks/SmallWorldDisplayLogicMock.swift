//
//  SmallWorldDisplayLogicMock.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import Foundation
@testable import SmallWorld_iOS

final class SmallWorldDisplayLogicMock: HomeDisplayLogic {
    
    var viewModelDisplayHome: HomeModel.MoviesList.ViewModel?

    var isFunctionWasCalled = false
    
    func displayMovies(viewModel: HomeModel.MoviesList.ViewModel, on queu: DispatchQueue) {
        isFunctionWasCalled = true
    }
    
    func displayError(viewModel: Main.Error.ViewModel, on queu: DispatchQueue) {
        isFunctionWasCalled = true
    }
}
