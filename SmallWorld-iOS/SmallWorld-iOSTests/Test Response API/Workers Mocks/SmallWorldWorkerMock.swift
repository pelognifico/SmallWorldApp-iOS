//
//  SmallWorldWorkerMock.swift
//  SmallWorld-iOSTests
//
//  Created by Carlos Villamizar on 26/11/21.
//

import Foundation
@testable import SmallWorld_iOS

class SmallWorldWorkerMock : HomeServiceProtocol {
    
    var resultGetMovies: (Result<HomeModel.MoviesList.Response, MainError>)?
    
    var isFunctionWasCalled = false
    
    func getMovies(request: HomeModel.MoviesList.Request, completion: @escaping (Result<HomeModel.MoviesList.Response, MainError>) -> Void) {
        if let result = resultGetMovies {
            isFunctionWasCalled = true
            completion(result)
        }
    }
}
