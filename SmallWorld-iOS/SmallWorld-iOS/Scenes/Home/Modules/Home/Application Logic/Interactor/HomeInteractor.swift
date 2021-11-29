//
//  HomeInteractor.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 25/11/21.
//

import UIKit

protocol HomeBusinessLogic {
    func getMovies(request: HomeModel.MoviesList.Request)
}

protocol HomeDataStore {
}

class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    
    var presenter: HomePresentationLogic?
    
    var worker: HomeServiceProtocol
    
    init(worker: HomeServiceProtocol = HomeWorker()) {
        self.worker = worker
    }
    
    // MARK: - Methods
    func getMovies(request: HomeModel.MoviesList.Request) {
        worker.getMovies(request: request, completion: { result in
            switch result {
            case .success(let response):
                self.presenter?.presentMovies(response: response)
            case .failure(let error):
                let response = Main.Error.Response(error: error)
                self.presenter?.presentError(response: response)
            }
        })
    }

}
