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
    //var poster: String
    //var interest
    //var completion: Boolean
    
    init(user: String, image: String, caption: String){
        self.user = user
        self.image = image
        self.caption = caption
    }
}
