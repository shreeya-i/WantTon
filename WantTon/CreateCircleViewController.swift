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
    let privateLabel = UILabel()
    let privateSwitch = UISwitch()
    
    let inviteLabel = UILabel()
    let createButton = UIButton()
    let line4 = UIView()
    
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
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Group Name"
        nameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nameLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(nameLabel)
        
        enterName.translatesAutoresizingMaskIntoConstraints = false
        enterName.borderStyle = UITextField.BorderStyle.roundedRect
        enterName.keyboardType = UIKeyboardType.default
        enterName.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.addSubview(enterName)
        
        line2.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        line2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(line2)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Description"
        descriptionLabel.font = UIFont.boldSystemFont(ofSize: 17)
        descriptionLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(descriptionLabel)
        
        enterDescription.translatesAutoresizingMaskIntoConstraints = false
        enterDescription.borderStyle = UITextField.BorderStyle.roundedRect
        enterDescription.keyboardType = UIKeyboardType.default
        enterDescription.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.addSubview(enterDescription)
        
        line3.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        line3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(line3)
        
        privateLabel.translatesAutoresizingMaskIntoConstraints = false
        privateLabel.text = "Private Circle"
        privateLabel.font = UIFont.boldSystemFont(ofSize: 17)
        privateLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(privateLabel)
        
        privateSwitch.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(privateSwitch)
        
        line4.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        line4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(line4)
        
        inviteLabel.translatesAutoresizingMaskIntoConstraints = false
        inviteLabel.text = "Invite Members From Contacts"
        inviteLabel.font = UIFont.systemFont(ofSize: 15)
        inviteLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(inviteLabel)
        
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.setTitleColor(.white, for: .normal)
        createButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        createButton.setTitle("Create Circle", for: .normal)
        createButton.clipsToBounds = true
        createButton.layer.cornerRadius = 15
        createButton.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(createButton)

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
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: line1.bottomAnchor, constant: 18),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
            ])

        NSLayoutConstraint.activate([
            enterName.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -7),
            enterName.widthAnchor.constraint(equalToConstant: 200),
            enterName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            enterName.heightAnchor.constraint(equalToConstant: 35)
            ])
        
        NSLayoutConstraint.activate([
            line2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            line2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            line2.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            line2.heightAnchor.constraint(equalToConstant: 2)
            ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: line2.bottomAnchor, constant: 18),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
            ])

        NSLayoutConstraint.activate([
            enterDescription.topAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -7),
            enterDescription.widthAnchor.constraint(equalToConstant: 200),
            enterDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            enterDescription.heightAnchor.constraint(equalToConstant: 35)
            ])
        
        NSLayoutConstraint.activate([
            line3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            line3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            line3.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            line3.heightAnchor.constraint(equalToConstant: 2)
            ])
        
        NSLayoutConstraint.activate([
            privateLabel.topAnchor.constraint(equalTo: line3.bottomAnchor, constant: 18),
            privateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
            ])

        NSLayoutConstraint.activate([
            privateSwitch.leadingAnchor.constraint(equalTo: enterDescription.leadingAnchor),
            privateSwitch.topAnchor.constraint(equalTo: privateLabel.topAnchor, constant: -5)
               ])
        
        NSLayoutConstraint.activate([
            line4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            line4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            line4.topAnchor.constraint(equalTo: privateLabel.bottomAnchor, constant: 20),
            line4.heightAnchor.constraint(equalToConstant: 2)
            ])
        
        NSLayoutConstraint.activate([
            inviteLabel.topAnchor.constraint(equalTo: line4.bottomAnchor, constant: 30),
            inviteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
            ])
        
        NSLayoutConstraint.activate ([
            createButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createButton.topAnchor.constraint(equalTo: inviteLabel.bottomAnchor, constant: 50),
            createButton.heightAnchor.constraint(equalToConstant: 40),
            createButton.widthAnchor.constraint(equalToConstant: 130)
        ])
        
    }
    
    @objc func didTapButton() {
        let newCircle = Circle(name: enterName.text!, image: "circle.png")
        homeController!.circleData.insert(newCircle, at: 0)
        self.dismiss(animated: true)
        //navigationController?.popViewController(animated: true)
    }

}
