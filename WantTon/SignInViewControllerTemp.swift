//
//  SignInViewControllerTemp.swift
//  SignInViewControllerTemp
//
//  Created by Brindha V on 27/7/21.
//

import UIKit
import FirebaseAuth

class SignInViewControllerTemp: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Log In"
        label.font = .systemFont(ofSize: 24, weight: .semibold)
        return label
    } ()
    
    
    
    private let emailField: UITextField = {
        let emailField  = UITextField()
        emailField.placeholder = "Email Address"
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.black.cgColor
        return emailField
    } ()
    
    private let passwordField: UITextField = {
        let passField = UITextField()
        passField.placeholder = "Password"
        passField.layer.borderWidth = 1
        passField.layer.borderColor = UIColor.black.cgColor
        return passField
    } ()
    
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor =  .systemGreen
        button.setTitleColor(.white,for: .normal)
        button.setTitle("Continue", for: .normal)
        return button
    } ()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(button)
        view.backgroundColor = .green
        
        button.addTarget(self,action:#selector(didTapButton),for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        label.frame = CGRect (x: 20
                              ,y:100,
                              width: view.frame.size.width-40,
                              height:80)
        emailField.frame = CGRect (x:20,
                                   y:label.frame.origin.y+label.frame.size.height+10,
                                   width: view.frame.size.width-40,
                                   height: 50)
        passwordField.frame = CGRect (x:20,
                                      y:emailField.frame.origin.y+emailField.frame.size.height+10,
                                      width: view.frame.size.width-40,
                                      height:50)
        button.frame = CGRect (x:20,
                               y:passwordField.frame.origin.y+passwordField.frame.size.height+10,
                               width:view.frame.size.width-40,
                               height:80)
    }
    
    override func viewDidAppear(_ animated:Bool){
        super.viewDidAppear(animated)
        emailField.becomeFirstResponder()
    }
    @objc private func didTapButton() {
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
                strongSelf.showCreateAccount(email: email,password:password)
                // show account creation
                return
            }
                print("you have signed in")
                  strongSelf.label.isHidden = true
                  strongSelf.emailField.isHidden = true
                  strongSelf.passwordField.isHidden = true
                  strongSelf.button.isHidden = true
                  
            })
    
}
    func showCreateAccount(email: String, password: String){
         let  alert = UIAlertController(title: "Create Account",
                                    message: "Would you like to create an account",
                                    preferredStyle: .alert)
          alert.addAction(UIAlertAction(title:"Continue",
                                        style: .default,
                                        handler: {_ in
                                            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: email, completion: {[weak self] result, error in
                                                  guard let strongSelf = self else{
                                                        return
                                                    }
                                                            
                                                  guard error == nil else {
                                                      print("Account creation failed")
                                                  // show account creation
                                                      return
                                              }
                                                  print("you have signed in")
                                                  strongSelf.label.isHidden = true
                                                  strongSelf.emailField.isHidden = true
                                                  strongSelf.passwordField.isHidden = true
                                                  strongSelf.button.isHidden = true
                                              })
           }))
          alert.addAction(UIAlertAction(title:"Cancel",
                                        style: .cancel,
                                        handler:{_ in
          }))
          
        present(alert, animated:true)
          }
                                        
}
            
