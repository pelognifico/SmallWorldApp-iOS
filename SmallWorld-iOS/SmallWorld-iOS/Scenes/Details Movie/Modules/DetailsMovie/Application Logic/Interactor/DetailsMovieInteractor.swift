//
//  DetailsMovieInteractor.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 25/11/21.
//

import Foundation

protocol DetailsMovieBusinessLogic {
    func getMovies(request: HomeModel.MoviesList.Request)
}

protocol DetailsMovieDataStore {
}

class DetailsMovieInteractor: DetailsMovieBusinessLogic, DetailsMovieDataStore {
    
    var presenter: DetailsMoviePresentationLogic?
    
    var worker: HomeServiceProtocol
    
    init(worker: HomeServiceProtocol = HomeWorker()) {
        self.worker = worker
    }
    
    // MARK: - Methods
    func getMovies(request: HomeModel.MoviesList.Request) {
        worker.getMovies(request: request, completion: { result in
            switch result {
            case .success(let response): break
//                self.presenter?.presentMovies(response: response)
            case .failure(let error):
                let response = Main.Error.Response(error: error)
                self.presenter?.presentError(response: response)
            }
        })
    }
}
