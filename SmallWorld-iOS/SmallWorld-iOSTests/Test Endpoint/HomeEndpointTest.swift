//
//  HomeEndpointTest.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import XCTest
@testable import SmallWorld_iOS

class HomeEndpointTest: XCTestCase {
    var sut: HomeEndpoint!
    
    //MARK: - GET METHOD
    
    func testGetMovies() {
        sut = .getMovies

        XCTAssertEqual(sut.method, .get)
        XCTAssertEqual(sut.path, "popular?api_key=62105c98a0dffc156c8472d37aaf606b")
        XCTAssertNil(sut.parameter)
    }
}
