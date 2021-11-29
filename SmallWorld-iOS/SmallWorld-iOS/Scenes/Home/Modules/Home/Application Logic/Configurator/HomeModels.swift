//
//  HomeModels.swift
//  SmallWorld-iOS
//
//  Created by Carlos Villamizar on 25/11/21.
//

import UIKit

enum HomeModel {
    enum MoviesList {
        struct Request {
        }

        struct Response: Codable {
            
            let page: Int
            let results: [Movies]
            let total_pages: Int
            let total_results: Int

            enum CodingKeys: String, CodingKey {
                case page
                case results
                case total_pages
                case total_results
            }
        }
        
        struct ViewModel {
            let moviesList: [Movies]
        }
    }
    
}
