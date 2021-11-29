//
//  HomeAPI.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 23/11/21.
//

import Foundation

class HomeAPI: HomeServiceProtocol {
    func getMovies(request: HomeModel.MoviesList.Request, completion: @escaping (Result<HomeModel.MoviesList.Response, MainError>) -> Void) {
        NetworkService.share.request(endpoint: HomeEndpoint.getMovies) { result in
            switch result {
            case .success:
                do {
                    let data = try result.get()
                    let response = try JSONDecoder().decode(HomeModel.MoviesList.Response.self, from: data!)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(.parse(error)))
                }
            case .failure(let error):
                completion(.failure(.network(error)))
            }
        }
    }
}
