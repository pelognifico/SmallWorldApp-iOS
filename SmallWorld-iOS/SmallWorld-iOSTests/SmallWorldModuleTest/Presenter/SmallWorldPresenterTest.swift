//
//  SmallWorldPresenterTest.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import XCTest
import Foundation
@testable import SmallWorld_iOS

class SmallWorldPresenterTest: XCTestCase {
    var sut: HomePresenter!
    var viewControllerMock: SmallWorldDisplayLogicMock!
    
    override func setUp() {
        viewControllerMock = SmallWorldDisplayLogicMock()
        sut = HomePresenter()
        sut.viewController = viewControllerMock
    }
    
    func testPresentMoviesSuccess() {
        //Given
        let lfsResponseMock : [Movies] = [.init(poster_path: "ABC", adult: true, overview: "ABC", release_date: "ABC", genre_ids: [23], id: 1, original_title: "ABC", original_language: "ABC", title: "ABC", backdrop_path: "ABC", popularity: 1, vote_count: 1, video: false, vote_average: 1)]
        let responseMock = HomeModel.MoviesList.Response(page: 1, results: lfsResponseMock, total_pages: 1, total_results: 1)
        
        let viewModel = HomeModel.MoviesList.ViewModel(moviesList: [])
        let queue = DispatchQueue(label: "FileLoaderTests")
        viewControllerMock.displayMovies(viewModel: viewModel, on: queue)
        
        //When
        queue.sync {
            sut.presentMovies(response: responseMock)
        }
        
        let result = viewControllerMock.isFunctionWasCalled
        
        //Then
        XCTAssertTrue((result))
    }
    
    func testPresentSmallWorldFailure() {
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
