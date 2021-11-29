//
//  HomePresenter.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 25/11/21.
//

import UIKit

protocol HomePresentationLogic {
    func presentMovies(response: HomeModel.MoviesList.Response)
    func presentError(response: Main.Error.Response)
}

class HomePresenter: HomePresentationLogic {
    
    weak var viewController: HomeDisplayLogic?
    
    // MARK: - Present Movies
    func presentMovies(response: HomeModel.MoviesList.Response) {
        let viewModel = HomeModel.MoviesList.ViewModel(moviesList: response.results)
        viewController?.displayMovies(viewModel: viewModel, on: .main)
    }
    
    // MARK: - Present Error
    func presentError(response: Main.Error.Response) {
        let viewModel = Main.Error.ViewModel(error: response.error)
        viewController?.displayError(viewModel: viewModel, on: .main)
    }
}
