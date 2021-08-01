//
//  CircleTableViewCell.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/28/21.
//

import UIKit

class CircleTableViewCell: UITableViewCell {
    
    let circleLabel = UILabel()
    let circleImage = UIImageView(frame: CGRect(x: 0,y: 0,width: 70,height: 70))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle  = .none
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        circleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        circleLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        circleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(circleLabel)
        
        circleImage.layer.masksToBounds = false
        circleImage.layer.cornerRadius = circleImage.frame.height/2
        circleImage.clipsToBounds = true
        circleImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(circleImage)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            circleLabel.leadingAnchor.constraint(equalTo: circleImage.trailingAnchor, constant: 40),
            circleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            circleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            circleImage.widthAnchor.constraint(equalToConstant: 70),
            circleImage.heightAnchor.constraint(equalToConstant: 70)
            ])
    }
    
    func configure(with circle: Circle){
        circleLabel.text = circle.name
        circleImage.image = UIImage(named: circle.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
