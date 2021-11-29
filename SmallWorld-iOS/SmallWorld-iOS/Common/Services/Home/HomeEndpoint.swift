//
//  HomeEndpoint.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 23/11/21.
//

import Alamofire

enum HomeEndpoint {
    case getMovies
}

extension HomeEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .getMovies:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getMovies:
            return "popular?api_key=62105c98a0dffc156c8472d37aaf606b"
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .getMovies:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        switch self {
        case .getMovies:
            return nil
        }
    }
    
    var encoding: ParameterEncoding {
        return JSONEncoding.default
    }
}
