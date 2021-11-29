//
//  Helper.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 23/11/21.
//

import Foundation
import UIKit

struct Helper {
    
//    static func apiBaseUrl()->String{
//        let env : String = Bundle.main.infoDictionary!["API_BASE_URL"] as! String
//        return env
//    }
//
//    static func addSpecifictCorner(boundsIn: CGRect, positionIn: CGPoint, roundedRectIn: CGRect, byRoundingCornersIn: UIRectCorner) -> CALayer? {
//        let rectShape = CAShapeLayer()
//        rectShape.bounds = boundsIn
//        rectShape.position = positionIn
//        rectShape.path = UIBezierPath(roundedRect: roundedRectIn, byRoundingCorners: byRoundingCornersIn, cornerRadii: CGSize(width: 20, height: 20)).cgPath
//
//        return rectShape
//    }
    
//    static func getLottosSession() -> [Lottos]? {
//        let data = LHSettings.current.defaults.value(forKey: "lottosData") as? Data
//
//        if data != nil {
//            let USER = try? PropertyListDecoder().decode([Lottos].self, from: data!)
//            return USER!
//        } else {
//            return nil
//        }
//    }
//
//    static func setUserSession(_ model: [Lottos]) {
//        LHSettings.current.defaults.set(try? PropertyListEncoder().encode(model), forKey: "lottosData")
//    }
}

protocol HomeControllerDelegate {
    func handleMenuToggle()
}
