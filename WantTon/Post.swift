//
//  Post.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/17/21.
//

import Foundation

class Post {
    var user: String
    var image: String
    var caption: String
    var distance: String
    var address: String
    //var poster: String
    //var interest
    //var completion: Boolean
    
    init(user: String, image: String, caption: String, distance: String, address: String){
        self.user = user
        self.image = image
        self.caption = caption
        self.distance = distance
        self.address = address
    }
}
