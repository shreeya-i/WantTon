//
//  SignUpViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 8/7/21.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let background = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let nameField = UITextField()
    let emailField = UITextField()
    let passwordField = UITextField()
    let addressField = UITextField()
    let cityField = UITextField()
    let button = UIButton()
    
    let userDefaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationController?.navigationBar.isHidden = true
        
        view.backgroundColor = .white

        setUpViews()
        setUpConstraints()
    }
    
    func setUpViews(){
//        background.image = UIImage(named: "background")
//        background.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(background)
        
        titleLabel.font = UIFont.boldSystemFont(ofSize: 35)
        titleLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        titleLabel.text = "WanTon"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        subtitleLabel.font = UIFont.systemFont(ofSize: 20)
        subtitleLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        subtitleLabel.text = "The Community Kitchen"
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitleLabel)
        
        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.borderStyle = UITextField.BorderStyle.roundedRect
        nameField.keyboardType = UIKeyboardType.default
        nameField.placeholder = "Name"
        nameField.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.addSubview(nameField)
                
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.borderStyle = UITextField.BorderStyle.roundedRect
        emailField.keyboardType = UIKeyboardType.default
        emailField.placeholder = "Email Address"
        emailField.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.addSubview(emailField)
                
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordField.keyboardType = UIKeyboardType.default
        passwordField.placeholder = "Password"
        passwordField.isSecureTextEntry = true
        passwordField.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.addSubview(passwordField)
        
        addressField.translatesAutoresizingMaskIntoConstraints = false
        addressField.borderStyle = UITextField.BorderStyle.roundedRect
        addressField.keyboardType = UIKeyboardType.default
        addressField.placeholder = "Street Adress"
        addressField.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.addSubview(addressField)
        
        cityField.translatesAutoresizingMaskIntoConstraints = false
        cityField.borderStyle = UITextField.BorderStyle.roundedRect
        cityField.keyboardType = UIKeyboardType.default
        cityField.placeholder = "City"
        cityField.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.addSubview(cityField)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitle("Sign Up", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(button)
    }
    
    func setUpConstraints() {
//        NSLayoutConstraint.activate ([
//            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            background.topAnchor.constraint(equalTo: view.topAnchor),
//            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            background.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
        
        NSLayoutConstraint.activate ([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate ([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate ([
            nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 65),
            nameField.heightAnchor.constraint(equalToConstant: 45),
            nameField.widthAnchor.constraint(equalToConstant: 295)
        ])
        
        NSLayoutConstraint.activate ([
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 10),
            emailField.heightAnchor.constraint(equalToConstant: 45),
            emailField.widthAnchor.constraint(equalToConstant: 295)
        ])
        
        NSLayoutConstraint.activate ([
            passwordField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10),
            passwordField.heightAnchor.constraint(equalToConstant: 45),
            passwordField.widthAnchor.constraint(equalToConstant: 295)
        ])
        
        NSLayoutConstraint.activate ([
            addressField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addressField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 10),
            addressField.heightAnchor.constraint(equalToConstant: 45),
            addressField.widthAnchor.constraint(equalToConstant: 295)
        ])
        
        NSLayoutConstraint.activate ([
            cityField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityField.topAnchor.constraint(equalTo: addressField.bottomAnchor, constant: 10),
            cityField.heightAnchor.constraint(equalToConstant: 45),
            cityField.widthAnchor.constraint(equalToConstant: 295)
        ])
        
        NSLayoutConstraint.activate ([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: cityField.bottomAnchor, constant: 45),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 130)
        ])
        
    }
    
    @objc func didTapButton() {
        
        if let userName = nameField.text,
           let userCity = cityField.text,
           let userAddress = addressField.text{
            userDefaults.set(userCity, forKey: "userCity")
            userDefaults.set(userName, forKey: "userName")
            userDefaults.set(userAddress, forKey: "userAddress")
    }
        self.dismiss(animated: true)
    }

}
