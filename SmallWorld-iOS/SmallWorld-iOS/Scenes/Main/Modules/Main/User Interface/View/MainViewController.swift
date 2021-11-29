//
//  MainViewController.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 23/11/21.
//

import UIKit

protocol MainDisplayLogic: AnyObject {
//    func displaySearchAcronyms(viewModel: Main.SearchAcronyms.ViewModel, on queu: DispatchQueue)
    func displayError(viewModel: Main.Error.ViewModel, on queu: DispatchQueue)
}

class MainViewController: BaseViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var contentBottomBarView: UIView!
    
    let homeVC         = HomeViewController()
    
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?

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
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.clearBackground()
        
        settingFirstViewController()
    }
    
    // MARK: - Methods
    private func settingFirstViewController() {
        add(child: homeVC, container: contentView)
        homeVC.view.frame = contentView.bounds
    }

}

// MARK: - MainDisplayLogic
extension MainViewController: MainDisplayLogic {
//    func displaySearchAcronyms(viewModel: Main.SearchAcronyms.ViewModel, on queu: DispatchQueue = .main) {
//        hideLoading()
//
//        filteredAcronym.removeAll()
//        if viewModel.data.count > 0 {
//            view.endEditing(true)
//            defaultView.isHidden = true
//            dataAcronym = viewModel.data[0].lfs
//
//            refresher.endRefreshing()
//            acronymsTableView.reloadData()
//        }
//    }
//
    func displayError(viewModel: Main.Error.ViewModel, on queu: DispatchQueue = .main) {
        hideLoading()

        displaySimpleAlert(with: "Error", message: viewModel.error.description)
    }
    
}
