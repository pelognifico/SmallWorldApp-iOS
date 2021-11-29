//
//  SmallWorldViewControllerTest.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import XCTest
import Foundation
@testable import SmallWorld_iOS

class SmallWorldViewControllerTest: XCTestCase {
    var sut: HomeViewController!
    var viewControllerMock: SmallWorldDisplayLogicMock!
    
    override func setUp() {
        super.setUp()
        
        viewControllerMock = SmallWorldDisplayLogicMock()
        sut = HomeViewController()
    }
    
    func testGetMovies() {
        //Given
        let lfsResponseMock : [Movies] = [.init(poster_path: "ABC", adult: true, overview: "ABC", release_date: "ABC", genre_ids: [23], id: 1, original_title: "ABC", original_language: "ABC", title: "ABC", backdrop_path: "ABC", popularity: 1, vote_count: 1, video: false, vote_average: 1)]
        let responseMock = lfsResponseMock
        
        let viewModel = HomeModel.MoviesList.ViewModel(moviesList: responseMock)
        let queue = DispatchQueue(label: "FileLoaderTests")
        
        viewControllerMock.displayMovies(viewModel: viewModel, on: queue)
        
        //When
        queue.sync {
            sut.loadInitialData()
        }
        
        let result = viewControllerMock.isFunctionWasCalled
        
        //Then
        XCTAssertTrue((result))
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
