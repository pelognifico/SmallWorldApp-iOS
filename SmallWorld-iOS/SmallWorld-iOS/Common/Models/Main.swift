//
//  Main.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 23/11/21.
//

import UIKit

enum ItemBottomBar: CaseIterable {
    case home
    case favorite
    case notifications
    
    var image: UIImage {
        switch self {
        case .home:
            let image = UIImage(named: "home")!
            return image
        case .favorite:
            let image = UIImage(named: "favorite")!
            return image
        case .notifications:
            let image = UIImage(named: "notifications")!
            return image
        }
    }
    
    var name: String {
        switch self {
        case .home:
            return "HOME"
        case .favorite:
            return "MY FAVORITES"
        case .notifications:
            return "NOTIFICATIONS"
        }
    }
    
    var isEnable: Bool {
        switch self {
        case .home:
            return true
        case .favorite:
            return true
        case .notifications:
            return true
        }
    }
}
