//
//  JoinCirclesViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/29/21.
//

import UIKit

class JoinCirclesViewController: UIViewController {
    
    let backButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        view.addSubview(backButton)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

}
