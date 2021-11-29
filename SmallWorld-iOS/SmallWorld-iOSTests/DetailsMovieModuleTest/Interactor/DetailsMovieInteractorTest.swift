//
//  DetailsMovieInteractorTest.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import XCTest
import Foundation
@testable import SmallWorld_iOS

class DetailsMovieInteractorTest: XCTestCase {
    var sut: DetailsMovieInteractor!
    var detailsMoviePresenterMock: SmallWorldWorkerMock!

    override func setUp() {
        detailsMoviePresenterMock = SmallWorldWorkerMock()
        sut = DetailsMovieInteractor(worker: detailsMoviePresenterMock)
    }

    func testDetailsMovieFailure() {
        //Given
        let requestData = HomeModel.MoviesList.Request()
        let failure : MainError = .request

        detailsMoviePresenterMock.resultGetMovies = .failure(failure)
        detailsMoviePresenterMock.isFunctionWasCalled = false

        //When
        sut.getMovies(request: requestData)
        let result = detailsMoviePresenterMock.isFunctionWasCalled

        //Then
        XCTAssertTrue(result)
    }
}
