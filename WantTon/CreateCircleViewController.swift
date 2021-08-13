//
//  CreateCircleViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 8/12/21.
//

import UIKit

class CreateCircleViewController: UIViewController {
    
    let saveButton = UIButton()
    let titleLabel = UILabel()
    let circleImage = UIImageView(frame: CGRect(x: 0,y: 0,width: 120,height: 120))
    let addCoverLabel = UILabel()
    let line1 = UIView()
    let nameLabel = UILabel()
    let enterName = UITextField()
    let line2 = UIView()
    let descriptionLabel = UILabel()
    let enterDescription = UITextField()
    let line3 = UIView()
    let inviteLabel = UILabel()
    //let line4 = UIView()
    
    var homeController: CirclesViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        titleLabel.text = "Create New Circle"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        circleImage.layer.masksToBounds = false
        circleImage.layer.cornerRadius = circleImage.frame.height/2
        circleImage.clipsToBounds = true
        circleImage.translatesAutoresizingMaskIntoConstraints = false
        circleImage.image = UIImage(named: "circle.png")
        view.addSubview(circleImage)
        
        addCoverLabel.font = UIFont.systemFont(ofSize: 15)
        addCoverLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        addCoverLabel.text = "Add Cover Photo"
        addCoverLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addCoverLabel)
        
        line1.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        line1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(line1)
        
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            circleImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            circleImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 55),
            circleImage.widthAnchor.constraint(equalToConstant: 120),
            circleImage.heightAnchor.constraint(equalToConstant: 120)
            ])
        
        NSLayoutConstraint.activate([
            addCoverLabel.topAnchor.constraint(equalTo: circleImage.bottomAnchor, constant: 15),
            addCoverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            line1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            line1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            line1.topAnchor.constraint(equalTo: addCoverLabel.bottomAnchor, constant: 30),
            line1.heightAnchor.constraint(equalToConstant: 2)
            ])
        
    }

}
