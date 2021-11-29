//
//  SWBottomBarViewController.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 24/11/21.
//

import UIKit

protocol SWBottomBarViewControllerDelegate: AnyObject {
    func didSelect(item: ItemBottomBar)
}

class FWBottomBarViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var viewLine: UIView!
    
    weak var delegate: SWBottomBarViewControllerDelegate?
    
    let cellNibName = "ItemCollectionViewCell"
    
    private var items = [ItemBottomBar]()

    override func viewDidLoad() {
        super.viewDidLoad()

        settingCollectionView()
        
        viewLine.backgroundColor = .blue
    }
    
    // MARK: - Methods
    private func settingCollectionView() {
        collectionView.register(UINib(nibName: cellNibName, bundle: nil),
                                forCellWithReuseIdentifier: ItemCollectionViewCell.reuseIdentifier)
    }

    func setValues(items: [ItemBottomBar]) {
        self.items = items
        
        collectionView.reloadData()
        DispatchQueue.main.async(execute: {
            self.collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .left)
        })
    }
    
    func select(item: ItemBottomBar) {
        for (index, _item) in items.enumerated() {
            if item == _item {
                let indexPath = IndexPath(item: index, section: 0)
                
                collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredVertically)
                
                break
            }
        }
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
extension FWBottomBarViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemCollectionViewCell.reuseIdentifier,
                                                            for: indexPath) as? ItemCollectionViewCell else {
            fatalError()
        }
        
        cell.configure(item: items[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard parent != nil else { return CGSize(width: ItemCollectionViewCell.cellHeight, height: ItemCollectionViewCell.cellHeight) }
        
        return CGSize(width: collectionView.frame.width / CGFloat(items.count), height: ItemCollectionViewCell.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelect(item: items[indexPath.row])
    }
}
