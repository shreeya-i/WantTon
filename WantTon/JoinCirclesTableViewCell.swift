//
//  JoinCirclesTableViewCell.swift
//  WantTon
//
//  Created by Shreeya Indap on 8/1/21.
//

import UIKit

class JoinCirclesTableViewCell: UITableViewCell {

    let circleLabel = UILabel()
    let circleImage = UIImageView(frame: CGRect(x: 0,y: 0,width: 50,height: 50))
    let joinButton = UIButton()

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
        
        joinButton.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 0.6)
        joinButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        joinButton.tintColor = .white
        joinButton.translatesAutoresizingMaskIntoConstraints = false
        joinButton.addTarget(self, action: #selector(joinButtonPressed), for: .touchUpInside)
        contentView.addSubview(joinButton)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            circleLabel.leadingAnchor.constraint(equalTo: circleImage.trailingAnchor, constant: 20),
            circleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            circleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            circleImage.widthAnchor.constraint(equalToConstant: 50),
            circleImage.heightAnchor.constraint(equalToConstant: 50)
            ])
        
        NSLayoutConstraint.activate([
            joinButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            joinButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            joinButton.widthAnchor.constraint(equalToConstant: 50),
            joinButton.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    @objc func joinButtonPressed(sender: UIButton) {
            sender.isSelected = !sender.isSelected
            if(sender.isSelected == true){
                sender.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
            }
            else{
                sender.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 0.6)
            }
    }
    
    func configure(with circle: Circle){
        circleLabel.text = circle.name
        circleImage.image = UIImage(named: circle.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
