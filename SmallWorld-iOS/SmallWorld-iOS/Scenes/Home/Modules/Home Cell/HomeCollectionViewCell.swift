//
//  HomeCollectionViewCell.swift
//  SmallWorld-iOS
//
//  Created by Ruben Duarte on 25/11/21.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var pictureImageView: SWImageView!
    @IBOutlet weak var pointsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    static let reuseIdentifier = "HomeViellCell"
    static let cellHeight: CGFloat = 270

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configUI(movies: Movies) {
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd"

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MMM dd,yyyy"
        
        pictureImageView.setImage(urlString: "https://image.tmdb.org/t/p/w500/\(movies.poster_path ?? "")", imageView: pictureImageView)
        pointsLabel.text = String(movies.vote_average)
        titleLabel.text = movies.original_title
        
        if let date = dateFormatterGet.date(from: "\(movies.release_date)") {
            print(dateFormatterPrint.string(from: date))
            ageLabel.text = dateFormatterPrint.string(from: date)
        } else {
           print("There was an error decoding the string")
        }
        
    }

}
