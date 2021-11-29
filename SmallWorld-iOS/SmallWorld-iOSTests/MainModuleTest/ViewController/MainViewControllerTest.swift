//
//  MainViewControllerTest.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import XCTest
import Foundation
@testable import SmallWorld_iOS

class MainViewControllerTest: XCTestCase {
    var sut: MainViewController!
    var viewControllerMock: MainDisplayLogicMock!
    
    override func setUp() {
        super.setUp()
        
        viewControllerMock = MainDisplayLogicMock()
        sut = MainViewController()
    }
    
    func testFailure() {
        //Given
        let error: MainError = .request
//        let responseMock = Main.Error.Response(error: error)
        let viewModel = Main.Error.ViewModel(error: error)
        let queue = DispatchQueue(label: "FileLoaderTests")
        viewControllerMock.displayError(viewModel: viewModel, on: queue)
        
        //When
        queue.sync {
            sut.displayError(viewModel: viewModel, on: queue)
        }
        
        let result = viewControllerMock.isFunctionWasCalled
        
        //Then
        XCTAssertTrue((result))
    }
    
}
