//
//  DetailsMoviePresenterTest.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import XCTest
import Foundation
@testable import SmallWorld_iOS

class DetailsMoviePresenterTest: XCTestCase {
    var sut: DetailsMoviePresenter!
    var viewControllerMock: DetailsMovieDisplayLogicMock!
    
    override func setUp() {
        viewControllerMock = DetailsMovieDisplayLogicMock()
        sut = DetailsMoviePresenter()
        sut.viewController = viewControllerMock
    }

    func testPresentDetailsMovieFailure() {
        //Given
        let error: MainError = .request
        let responseMock = Main.Error.Response(error: error)
        let viewModel = Main.Error.ViewModel(error: error)
        let queue = DispatchQueue(label: "FileLoaderTests")
        viewControllerMock.displayError(viewModel: viewModel, on: queue)
        
        //When
        queue.sync {
            sut.presentError(response: responseMock)
        }
        
        let result = viewControllerMock.isFunctionWasCalled
        
        //Then
        XCTAssertTrue((result))
    }
}
