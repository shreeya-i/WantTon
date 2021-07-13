//
//  ViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    let name = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        name.text = "HEY TEAM <3"
        name.font = UIFont.boldSystemFont(ofSize: 15)
        name.textColor = UIColor.lightGray
        name.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(name)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            name.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            name.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }


}

