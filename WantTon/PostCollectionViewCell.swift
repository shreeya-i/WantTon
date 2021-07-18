//
//  PostCollectionViewCell.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/17/21.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    private var postimage = UIImageView()

    override init(frame: CGRect){
        super.init(frame: frame)
        
        postimage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(postimage)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            postimage.topAnchor.constraint(equalTo: contentView.topAnchor),
            postimage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            postimage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            postimage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func configure(for post: Post){
        postimage.image = UIImage(named: post.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
