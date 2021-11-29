//
//  SmallWorldSuccessResponse.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import XCTest
@testable import SmallWorld_iOS

class SmallWorldSuccessResponse: XCTestCase {
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
        let lfsResponseMock : [Movies] = [.init(poster_path: "ABC", adult: true, overview: "ABC", release_date: "ABC", genre_ids: [23], id: 1, original_title: "ABC", original_language: "ABC", title: "ABC", backdrop_path: "ABC", popularity: 1, vote_count: 1, video: false, vote_average: 1)]
        let dataMock = HomeModel.MoviesList.Response(page: 1, results: lfsResponseMock, total_pages: 1, total_results: 1)
        let success : HomeModel.MoviesList.Response? = .some(dataMock)
        
        //When
        homeServiceProtocolMock.resultGetMovies = .success(success!)
        
        //Then
        sut.getMovies(request: requestData, completion: { result in
            switch result {
            case .success(let response):
                XCTAssertNotNil(response)
                XCTAssertNotNil(response.results)
                XCTAssertEqual(response.page, dataMock.page)
                XCTAssertEqual(response.results.count, dataMock.results.count)
                XCTAssertEqual(response.total_pages, dataMock.total_pages)
                XCTAssertEqual(response.total_results, dataMock.total_results)
            case .failure(_):
                break
            }
        })
    }
}
