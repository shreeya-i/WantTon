//
//  AddToCircleTableViewCell.swift
//  WantTon
//
//  Created by Shreeya Indap on 8/7/21.
//

import UIKit

class AddToCircleTableViewCell: UITableViewCell {

    let circleLabel = UILabel()
    let circleImage = UIImageView(frame: CGRect(x: 0,y: 0,width: 40,height: 40))
    let selectButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle  = .none
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        circleLabel.font = UIFont.boldSystemFont(ofSize: 15)
        circleLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        circleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(circleLabel)
        
        circleImage.layer.masksToBounds = false
        circleImage.layer.cornerRadius = circleImage.frame.height/2
        circleImage.clipsToBounds = true
        circleImage.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(circleImage)
        
        selectButton.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 0.7)
        selectButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
        selectButton.tintColor = .white
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        selectButton.addTarget(self, action: #selector(joinButtonPressed), for: .touchUpInside)
        contentView.addSubview(selectButton)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            circleLabel.leadingAnchor.constraint(equalTo: circleImage.trailingAnchor, constant: 20),
            circleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            circleImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            circleImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            circleImage.widthAnchor.constraint(equalToConstant: 40),
            circleImage.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            selectButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            selectButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            selectButton.widthAnchor.constraint(equalToConstant: 50),
            selectButton.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    @objc func joinButtonPressed(sender: UIButton) {
            sender.isSelected = !sender.isSelected
            if(sender.isSelected == true){
                sender.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
            }
            else{
                sender.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 0.7)
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
