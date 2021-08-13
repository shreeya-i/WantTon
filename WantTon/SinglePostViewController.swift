//
//  SinglePostViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/27/21.
//

import UIKit

class SinglePostViewController: UIViewController {
    
    let userName = UILabel()
    let productImage = UIImageView()
    let caption = UILabel()
    let distance = UILabel()
    let location = UILabel()
    let availableTimes = UILabel()
    let interestButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        userName.font = UIFont.boldSystemFont(ofSize: 20)
        userName.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        userName.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(userName)
        
        distance.font = UIFont.boldSystemFont(ofSize: 17)
        distance.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        distance.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(distance)
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(productImage)
        
        caption.font = UIFont.boldSystemFont(ofSize: 17)
        caption.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        caption.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(caption)
        
        location.font = UIFont.boldSystemFont(ofSize: 17)
        location.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        location.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(location)
        
        availableTimes.font = UIFont.boldSystemFont(ofSize: 17)
        availableTimes.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        availableTimes.translatesAutoresizingMaskIntoConstraints = false
        availableTimes.text = "Available Times: 5-9 PM"
        view.addSubview(availableTimes)
        
        interestButton.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 0.7)
        interestButton.setTitle("Interested", for: .normal)
        interestButton.setTitleColor(UIColor.white, for: .normal)
        interestButton.clipsToBounds = true
        interestButton.layer.cornerRadius = 5
        interestButton.translatesAutoresizingMaskIntoConstraints = false
        interestButton.addTarget(self, action: #selector(interestButtonPressed), for: .touchUpInside)
        view.addSubview(interestButton)
        

        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            userName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            distance.bottomAnchor.constraint(equalTo: userName.bottomAnchor),
            distance.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            productImage.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30),
            productImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            productImage.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            caption.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 30),
            caption.leadingAnchor.constraint(equalTo: userName.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            location.topAnchor.constraint(equalTo: caption.bottomAnchor, constant: 8),
            location.leadingAnchor.constraint(equalTo: userName.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            availableTimes.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 8),
            availableTimes.leadingAnchor.constraint(equalTo: userName.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate ([
            interestButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            interestButton.topAnchor.constraint(equalTo: availableTimes.bottomAnchor, constant: 50),
            interestButton.heightAnchor.constraint(equalToConstant: 40),
            interestButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    func configure(with post: Post){
        userName.text = post.user
        distance.text = post.distance
        productImage.image = UIImage(named: post.image)
        caption.text = "\(post.caption)"
        location.text = "Pickup Location: \(post.address)"
    }
    
    @objc func interestButtonPressed(sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if(sender.isSelected == true){
            sender.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        }
        else{
            sender.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 0.7)
        }
    }

}
