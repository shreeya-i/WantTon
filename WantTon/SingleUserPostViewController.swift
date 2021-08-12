//
//  SingleUserPostViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 8/11/21.
//

import UIKit

class SingleUserPostViewController: UIViewController {
    
    let userName = UILabel()
    let productImage = UIImageView()
    let caption = UILabel()
    let interestLabel = UILabel()
    let interestName = UILabel()
    let acceptButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        userName.font = UIFont.boldSystemFont(ofSize: 20)
        userName.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        userName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userName)
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(productImage)
        
        caption.font = UIFont.boldSystemFont(ofSize: 17)
        caption.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        caption.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(caption)
        
        acceptButton.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 0.7)
        acceptButton.setTitle("Interested", for: .normal)
        acceptButton.setTitleColor(UIColor.white, for: .normal)
        acceptButton.clipsToBounds = true
        acceptButton.layer.cornerRadius = 5
        acceptButton.translatesAutoresizingMaskIntoConstraints = false
        acceptButton.addTarget(self, action: #selector(acceptButtonPressed), for: .touchUpInside)
        view.addSubview(acceptButton)
        

        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 10),
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productImage.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            caption.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 10),
            caption.leadingAnchor.constraint(equalTo: userName.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate ([
            acceptButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            acceptButton.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: 30),
            acceptButton.heightAnchor.constraint(equalToConstant: 40),
            acceptButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    func configure(with post: Post){
        userName.text = post.user
        productImage.image = UIImage(named: post.image)
        caption.text = "Description: \(post.caption)"
    }
    
    @objc func acceptButtonPressed(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if(sender.isSelected == true){
            sender.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        }
        else{
            sender.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 0.7)
        }
        self.dismiss(animated: true)
    }

}
