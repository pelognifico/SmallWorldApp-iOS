//
//  SmallWorldInteractorTest.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import XCTest
import Foundation
@testable import SmallWorld_iOS

class SmallWorldInteractorTest: XCTestCase {
    var sut: HomeInteractor!
    var homePresenterMock: SmallWorldWorkerMock!
    
    override func setUp() {
        homePresenterMock = SmallWorldWorkerMock()
        sut = HomeInteractor(worker: homePresenterMock)
    }
    
    func testSmallWorldSuccess() {
        //Given
        let requestData = HomeModel.MoviesList.Request()
        let lfsResponseMock : [Movies] = [.init(poster_path: "ABC", adult: true, overview: "ABC", release_date: "ABC", genre_ids: [23], id: 1, original_title: "ABC", original_language: "ABC", title: "ABC", backdrop_path: "ABC", popularity: 1, vote_count: 1, video: false, vote_average: 1)]
        let responseMock = HomeModel.MoviesList.Response(page: 1, results: lfsResponseMock, total_pages: 1, total_results: 1)
        
        homePresenterMock.resultGetMovies = .success(responseMock)
        homePresenterMock.isFunctionWasCalled = false
        
        //When
        sut.getMovies(request: requestData)
        let result = homePresenterMock.isFunctionWasCalled
        
        //Then
        XCTAssertTrue(result)
    }
    
    func testSmallWorldFailure() {
        //Given
        let requestData = HomeModel.MoviesList.Request()
        let failure : MainError = .request

        homePresenterMock.resultGetMovies = .failure(failure)
        homePresenterMock.isFunctionWasCalled = false

        //When
        sut.getMovies(request: requestData)
        let result = homePresenterMock.isFunctionWasCalled

        //Then
        XCTAssertTrue(result)
    }
}
