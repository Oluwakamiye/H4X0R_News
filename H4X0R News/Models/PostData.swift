//
//  PostData.swift
//  H4X0R News
//
//  Created by Oluwakamiye Akindele on 10/12/2019.
//  Copyright © 2019 Oluwakamiye Akindele. All rights reserved.
//

import Foundation

struct Results : Decodable{
    var hits : [Post]
}

struct Post : Decodable, Identifiable{
    var id : String {
        return objectID
    }
    var objectID : String
    var created_at : String
    var title : String
    var url : String?
    var author: String
    var points : Int
    var num_comments : Int
    var _tags  :[String]
}
