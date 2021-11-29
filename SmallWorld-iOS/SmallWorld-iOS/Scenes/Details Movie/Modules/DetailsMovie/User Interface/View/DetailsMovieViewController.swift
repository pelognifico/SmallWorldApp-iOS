//
//  DetailsMovieViewController.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 25/11/21.
//

import UIKit

protocol DetailsMovieDisplayLogic: AnyObject {
    func displayError(viewModel: Main.Error.ViewModel, on queu: DispatchQueue)
}

class DetailsMovieViewController: BaseViewController {
    
    @IBOutlet weak var pictureImageView: SWImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var averageLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var moviesData: Movies?
    
    var interactor: DetailsMovieBusinessLogic?
    var router: (NSObjectProtocol & DetailsMovieRoutingLogic & DetailsMovieDataPassing)?
    
    // MARK: - Object lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - Setup
    private func setup() {
        let viewController = self
        let interactor = DetailsMovieInteractor()
        let presenter = DetailsMoviePresenter()
        let router = DetailsMovieRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackButton()
        loadInitialData(movies: moviesData)
    }
    
    // MARK: - Methods
    func loadInitialData(movies: Movies?) {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        pictureImageView.setImage(urlString: "https://image.tmdb.org/t/p/w500/\(movies?.poster_path ?? "")", imageView: pictureImageView)
        averageLabel.text = String(movies!.vote_average)
        titleLabel.text = movies?.original_title
        languageLabel.text = movies?.original_language
        votesLabel.text = String(movies!.vote_count)
        popularityLabel.text = String(movies!.popularity)
//        descriptionLabel.text = movies?.overview
        descriptionTextView.text = movies?.overview
        
        if let date = dateFormatterGet.date(from: "\(movies?.release_date ?? "")") {
            print(dateFormatterPrint.string(from: date))
            releaseLabel.text = dateFormatterPrint.string(from: date)
        } else {
           print("There was an error decoding the string")
        }
    }

}

// MARK: - DetailsMovieDisplayLogic
extension DetailsMovieViewController: DetailsMovieDisplayLogic {
    
    func displayError(viewModel: Main.Error.ViewModel, on queu: DispatchQueue = .main) {
        hideLoading()
        displaySimpleAlert(with: "Error", message: viewModel.error.description)
    }
}
