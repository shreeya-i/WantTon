//
//  PostTableViewCell.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/22/21.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    let productImage = UIImageView()
    let caption = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle  = .none
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews(){
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(productImage)
        
        caption.font = UIFont.boldSystemFont(ofSize: 17)
        caption.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        caption.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(caption)
        
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            productImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60),
            productImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            caption.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10),
            caption.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8)
        ])
    }
    
    func configure(with post: Post){
        productImage.image = UIImage(named: post.image)
        caption.text = post.caption
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
