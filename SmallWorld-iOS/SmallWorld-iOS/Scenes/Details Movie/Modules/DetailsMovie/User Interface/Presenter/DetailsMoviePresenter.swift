//
//  DetailsMoviePresenter.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 25/11/21.
//

import Foundation

protocol DetailsMoviePresentationLogic {
    func presentError(response: Main.Error.Response)
}

class DetailsMoviePresenter: DetailsMoviePresentationLogic {
    
    weak var viewController: DetailsMovieDisplayLogic?
    
    // MARK: - Present Error
    func presentError(response: Main.Error.Response) {
        let viewModel = Main.Error.ViewModel(error: response.error)
        viewController?.displayError(viewModel: viewModel, on: .main)
    }
}
