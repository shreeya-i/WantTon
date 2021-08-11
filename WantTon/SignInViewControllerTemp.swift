//
//  SignInViewControllerTemp.swift
//  SignInViewControllerTemp
//
//  Created by Brindha V on 27/7/21.
//

import UIKit
import FirebaseAuth

class SignInViewControllerTemp: UIViewController {
    
    let background = UIImageView()
    let titleLabel = UILabel()
   // let nameField = UITextField()
    let emailField = UITextField()
    let passwordField = UITextField()
    let button = UIButton()
    let signUpButton = UIButton()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        background.image = UIImage(named: "background")
        background.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(background)
       
        titleLabel.font = UIFont.boldSystemFont(ofSize: 35)
        titleLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        titleLabel.text = "WanTon"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
//        nameField.translatesAutoresizingMaskIntoConstraints = false
//        nameField.borderStyle = UITextField.BorderStyle.roundedRect
//        nameField.keyboardType = UIKeyboardType.default
//        nameField.placeholder = "Name"
//        nameField.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
//        view.addSubview(nameField)
        
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
        
        button.translatesAutoresizingMaskIntoConstraints = false
       // editButton.setTitleColor(UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.setTitle("Log In", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 15
        button.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(button)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.setTitleColor(UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0), for: .normal)
        //signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        signUpButton.setTitle("Sign Up", for: .normal)
        //signUpButton.clipsToBounds = true
       // signUpButton.layer.cornerRadius = 15
       // signUpButton.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(signUpButton)
    
        view.backgroundColor = .white
        
        setUpConstraints()
        
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate ([
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate ([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 185),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
//        NSLayoutConstraint.activate ([
//            nameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            nameField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
//            nameField.heightAnchor.constraint(equalToConstant: 45),
//            nameField.widthAnchor.constraint(equalToConstant: 295)
//        ])
        
        NSLayoutConstraint.activate ([
            emailField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 35),
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
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 35),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalToConstant: 130)
        ])
        
        NSLayoutConstraint.activate ([
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            signUpButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
//    override func viewDidLayoutSubviews(){
//        super.viewDidLayoutSubviews()
//        label.frame = CGRect (x: 20
//                              ,y:100,
//                              width: view.frame.size.width-40,
//                              height:80)
//        emailField.frame = CGRect (x:20,
//                                   y:label.frame.origin.y+label.frame.size.height+10,
//                                   width: view.frame.size.width-40,
//                                   height: 50)
//        passwordField.frame = CGRect (x:20,
//                                      y:emailField.frame.origin.y+emailField.frame.size.height+10,
//                                      width: view.frame.size.width-40,
//                                      height:50)
//        button.frame = CGRect (x:20,
//                               y:passwordField.frame.origin.y+passwordField.frame.size.height+10,
//                               width:view.frame.size.width-40,
//                               height:80)
//    }
    
    override func viewDidAppear(_ animated:Bool){
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }
    
    @objc private func didTapButton() {
        
        let pushViewController = TabBarViewController()
        navigationController?.pushViewController(pushViewController, animated: true)
        
        print("Continue button tapped")
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else{
                  print("Missing field data")
                  return
              }
    
                  
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion:{ [weak self]  result, error in
           guard let strongSelf = self else {
                return
            }
                          
                guard error == nil else {
             //  strongSelf.showCreateAccount(email: email,password:password)
                // show account creation
                return
            }
                print("you have signed in")
                  strongSelf.titleLabel.isHidden = true
                  strongSelf.emailField.isHidden = true
                  strongSelf.passwordField.isHidden = true
                  strongSelf.button.isHidden = true
                  
            })
    
}
    
    @objc func didTapSignUp() {
        let vc = SignUpViewController()
        self.present(vc, animated: true)
        
    }
    
//    func showCreateAccount(email: String, password: String){
//         let  alert = UIAlertController(title: "Create Account",
//                message: "Would you like to create an account",
//                preferredStyle: .alert)
//          alert.addAction(UIAlertAction(title:"Continue",
//                                        style: .default,
//                                        handler: {_ in
//                                            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: email, completion: {[weak self] result, error in
//                                                  guard let strongSelf = self else{
//                                                        return
//                                                    }
//
//                                                  guard error == nil else {
//                                                      print("Account creation failed")
//                                                  // show account creation
//                                                      return
//                                              }
//                                                  print("you have signed in")
//                                                  strongSelf.titleLabel.isHidden = true
//                                                  strongSelf.emailField.isHidden = true
//                                                  strongSelf.passwordField.isHidden = true
//                                                  strongSelf.button.isHidden = true
//                                              })
//           }))
//          alert.addAction(UIAlertAction(title:"Cancel",
//                                        style: .cancel,
//                                        handler:{_ in
//          }))
//
//        present(alert, animated:true)
//          }
                                        
}
            
