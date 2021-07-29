//
//  CircleTableViewCell.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/28/21.
//

import UIKit

class CircleTableViewCell: UITableViewCell {
    
    let circleLabel = UILabel()

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
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            circleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            circleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(with circle: Circle){
        circleLabel.text = circle.name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
