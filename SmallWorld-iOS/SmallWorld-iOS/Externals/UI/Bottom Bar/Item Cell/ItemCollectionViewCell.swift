//
//  ItemCollectionViewCell.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 24/11/21.
//

import UIKit

class ItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var view: UIView!
    
    static let reuseIdentifier = "ItemCellId"
    static let cellHeight: CGFloat = 60

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(item: ItemBottomBar) {
        isUserInteractionEnabled = item.isEnable
        
        imageView.image = item.image.withRenderingMode(.alwaysTemplate)
        
        view.layer.cornerRadius = 25
    }

}
