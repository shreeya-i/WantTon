//
//  PostTableViewCell.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/22/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let userName = UILabel()
    let productImage = UIImageView()
    let caption = UILabel()
    let distance = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle  = .none
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews(){
        
        userName.font = UIFont.boldSystemFont(ofSize: 20)
        userName.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        userName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(userName)
        
        distance.font = UIFont.boldSystemFont(ofSize: 17)
        distance.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        distance.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(distance)
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(productImage)
        
        caption.font = UIFont.boldSystemFont(ofSize: 17)
        caption.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        caption.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(caption)
        
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            userName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            distance.bottomAnchor.constraint(equalTo: userName.bottomAnchor),
            distance.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            productImage.heightAnchor.constraint(equalToConstant: 410),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            caption.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10),
            caption.leadingAnchor.constraint(equalTo: userName.leadingAnchor)
        ])

    }
    
    func configure(with post: Post){
        userName.text = post.user
        productImage.image = UIImage(named: post.image)
        caption.text = post.caption
        distance.text = post.distance
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

