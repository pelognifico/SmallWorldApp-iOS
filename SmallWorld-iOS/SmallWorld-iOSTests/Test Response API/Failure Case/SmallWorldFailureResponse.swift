//
//  SmallWorldFailureResponse.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import XCTest
@testable import SmallWorld_iOS

class SmallWorldFailureResponse: XCTestCase {
    var sut: HomeWorker!
    var homeServiceProtocolMock: SmallWorldWorkerMock!
    
    override func setUp() {
        homeServiceProtocolMock = SmallWorldWorkerMock()
        sut = HomeWorker(homeService: homeServiceProtocolMock)
    }
    
    //MARK: -- Test SearchAcronyms
    func testGetMovies(){
        //Given
        let requestData = HomeModel.MoviesList.Request()
        let failure : MainError = .request
        
        //When
        homeServiceProtocolMock.resultGetMovies = .failure(failure)
        
        //Then
        sut.getMovies(request: requestData, completion: { result in
            switch result {
            case .success(_):
                break
            case .failure(let error):
                XCTAssertNotNil(error)
                XCTAssertEqual(error.localizedDescription, failure.localizedDescription)
            }
        })
    }
}
