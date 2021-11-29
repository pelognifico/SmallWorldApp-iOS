//
//  HomeWorker.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 23/11/21.
//

import Foundation

protocol HomeServiceProtocol {
    func getMovies(request: HomeModel.MoviesList.Request, completion: @escaping (Result<HomeModel.MoviesList.Response, MainError>) -> Void)
}

class HomeWorker: HomeServiceProtocol{
    var homeService: HomeServiceProtocol
    
    init(homeService: HomeServiceProtocol = HomeAPI()) {
        self.homeService = homeService
    }
    
    func getMovies(request: HomeModel.MoviesList.Request, completion: @escaping (Result<HomeModel.MoviesList.Response, MainError>) -> Void) {
        homeService.getMovies(request: request, completion: { result in
            completion(result)
        })
    }
}
