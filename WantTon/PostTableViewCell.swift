//
//  PostTableViewCell.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/22/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let productImage = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews(){
        
    }
    
    func setUpConstraints() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
