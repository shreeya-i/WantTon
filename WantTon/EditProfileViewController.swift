//
//  EditProfileViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/27/21.
//

import UIKit



class EditProfileViewController: UIViewController {
    
    let saveButton = UIButton()
    let backButton = UIButton()
    let pfp = UIImageView(frame: CGRect(x: 0,y: 0,width: 150,height: 150))
    let addPfpLabel = UILabel()
    let line1 = UIView()
    let nameLabel = UILabel()
    let enterName = UITextField()
    let line2 = UIView()
    let addressLabel = UILabel()
    let enterAddress = UITextField()
    let line3 = UIView()
    let cityLabel = UILabel()
    let enterCity = UITextField()
    let line4 = UIView()
    let deactivateButton = UIButton()
    
    weak var delegate: ProfileDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.setTitleColor(UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0), for: .normal)
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        saveButton.setTitle("Save", for: .normal)
        view.addSubview(saveButton)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        view.addSubview(backButton)
        
        pfp.layer.masksToBounds = false
        pfp.layer.cornerRadius = pfp.frame.height/2
        pfp.clipsToBounds = true
        pfp.translatesAutoresizingMaskIntoConstraints = false
        pfp.image = UIImage(named: "defaultpfp.jpeg")
        view.addSubview(pfp)
        
        addPfpLabel.font = UIFont.systemFont(ofSize: 15)
        addPfpLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        addPfpLabel.text = "Change Profile Photo"
        addPfpLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addPfpLabel)
        
        line1.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        line1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(line1)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Name"
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
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.text = "Address"
        addressLabel.font = UIFont.boldSystemFont(ofSize: 17)
        addressLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(addressLabel)
        
        enterAddress.translatesAutoresizingMaskIntoConstraints = false
        enterAddress.borderStyle = UITextField.BorderStyle.roundedRect
        enterAddress.keyboardType = UIKeyboardType.default
        enterAddress.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.addSubview(enterAddress)
        
        line3.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        line3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(line3)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.text = "City"
        cityLabel.font = UIFont.boldSystemFont(ofSize: 17)
        cityLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(cityLabel)
        
        enterCity.translatesAutoresizingMaskIntoConstraints = false
        enterCity.borderStyle = UITextField.BorderStyle.roundedRect
        enterCity.keyboardType = UIKeyboardType.default
        enterCity.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.addSubview(enterCity)
        
        line4.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        line4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(line4)
        
        deactivateButton.translatesAutoresizingMaskIntoConstraints = false
        deactivateButton.setTitleColor(UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0), for: .normal)
        //deactivateButton.addTarget(self, action: #selector(pushButtonPressed), for: .touchUpInside)
        deactivateButton.setTitle("Deactivate Account", for: .normal)
        view.addSubview(deactivateButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: -6),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            pfp.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pfp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            pfp.widthAnchor.constraint(equalToConstant: 150),
            pfp.heightAnchor.constraint(equalToConstant: 150)
            ])
        
        NSLayoutConstraint.activate([
            addPfpLabel.topAnchor.constraint(equalTo: pfp.bottomAnchor, constant: 20),
            addPfpLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            line1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            line1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            line1.topAnchor.constraint(equalTo: addPfpLabel.bottomAnchor, constant: 30),
            line1.heightAnchor.constraint(equalToConstant: 2)
            ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: line1.bottomAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35)
            ])

        NSLayoutConstraint.activate([
            enterName.topAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -5),
            enterName.widthAnchor.constraint(equalToConstant: 240),
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
            addressLabel.topAnchor.constraint(equalTo: line2.bottomAnchor, constant: 15),
            addressLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
            ])

        NSLayoutConstraint.activate([
            enterAddress.topAnchor.constraint(equalTo: addressLabel.topAnchor, constant: -5),
            enterAddress.widthAnchor.constraint(equalToConstant: 240),
            enterAddress.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            enterAddress.heightAnchor.constraint(equalToConstant: 35)
            ])
        
        NSLayoutConstraint.activate([
            line3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            line3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            line3.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
            line3.heightAnchor.constraint(equalToConstant: 2)
            ])
        
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: line3.bottomAnchor, constant: 15),
            cityLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
            ])

        NSLayoutConstraint.activate([
            enterCity.topAnchor.constraint(equalTo: cityLabel.topAnchor, constant: -5),
            enterCity.widthAnchor.constraint(equalToConstant: 240),
            enterCity.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            enterCity.heightAnchor.constraint(equalToConstant: 35)
            ])
        
        NSLayoutConstraint.activate([
            line4.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            line4.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            line4.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 20),
            line4.heightAnchor.constraint(equalToConstant: 2)
            ])
        
        NSLayoutConstraint.activate([
            deactivateButton.topAnchor.constraint(equalTo: line4.bottomAnchor, constant: 30),
            deactivateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    
    }
    
    @objc func saveButtonPressed() {
        //delegate?.changePfp(newPfp: T##String)
        delegate?.changeName(newName: enterName.text!)
        delegate?.changeCity(newCity: enterCity.text!)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

}
