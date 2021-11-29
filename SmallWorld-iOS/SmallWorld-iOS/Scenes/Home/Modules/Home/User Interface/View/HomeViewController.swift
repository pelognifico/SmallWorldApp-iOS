//
//  HomeViewController.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 24/11/21.
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayMovies(viewModel: HomeModel.MoviesList.ViewModel, on queu: DispatchQueue)
    func displayError(viewModel: Main.Error.ViewModel, on queu: DispatchQueue)
}

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var moviesCollectionView: UICollectionView!
    @IBOutlet weak var searchTextField: SWTextField! {
        didSet {
            searchTextField?.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        }
    }
    
    var moviesList : [Movies]?
    
    private var isFiltering: Bool {
        return searchTextField?.text?.isEmpty == false
    }
    
    var moviesFilter: [Movies] = [] {
        didSet {
            moviesCollectionView.reloadData()
        }
    }
    
    lazy var refresher: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .red
        refreshControl.addTarget(self, action: #selector(loadInitialData), for: .valueChanged)
        return refreshControl
    }()
    
    //MARK: - Collection View
    let cellMoviesCollectionNibName = "HomeCollectionViewCell"
    
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    
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
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        settingsCollectionView()
        loadInitialData()
        self.navigationController?.clearBackground()
        
        getMovies() { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let success):
                print(success)
            }
        }
    }
    
    // MARK: - Methods
    @objc func loadInitialData() {
        showLoading()
        refresher.endRefreshing()
        
        let request = HomeModel.MoviesList.Request()
        interactor?.getMovies(request: request)
    }
    
    func settingsCollectionView(){
        moviesCollectionView.register(UINib(nibName: cellMoviesCollectionNibName, bundle: nil),
                                forCellWithReuseIdentifier: HomeCollectionViewCell.reuseIdentifier)
        
        moviesCollectionView.refreshControl = refresher
    }
    
    private func search() {
        if let text = searchTextField?.text?.lowercased() {
            moviesFilter = (moviesList?.filter({ (movie) -> Bool in
                return (movie.title.lowercased().contains(text))
            }))!
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        search()
    }
    
    func getMovies(request: @escaping (Result<Data,Error>) -> Void) {

        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=62105c98a0dffc156c8472d37aaf606b") else {
            print("url is not valid")
            return
        }

        let task =  URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard error == nil else {
                request(.failure(error!))
                return
            }
            request(.success(data!))

        }
        task.resume()
    }
    
}

// MARK: - HomeDisplayLogic
extension HomeViewController: HomeDisplayLogic {
    func displayMovies(viewModel: HomeModel.MoviesList.ViewModel, on queu: DispatchQueue = .main) {
        hideLoading()
        refresher.endRefreshing()
        moviesList = viewModel.moviesList
        
        moviesCollectionView.isHidden = moviesList?.count == 0
        moviesCollectionView.reloadData()
    }
    
    func displayError(viewModel: Main.Error.ViewModel, on queu: DispatchQueue = .main) {
        hideLoading()
        refresher.endRefreshing()
        
        displaySimpleAlert(with: "Error", message: viewModel.error.description)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        isFiltering ? moviesFilter.count : moviesList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = moviesCollectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.reuseIdentifier, for: indexPath) as? HomeCollectionViewCell else {
            fatalError()
        }
        
        if let movies = isFiltering ? moviesFilter[indexPath.row] : moviesList?[indexPath.row]{
            cell.configUI(movies: movies)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailsMovieViewController()
        vc.moviesData = isFiltering ? moviesFilter[indexPath.row] : moviesList?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 175, height: HomeCollectionViewCell.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }

}
