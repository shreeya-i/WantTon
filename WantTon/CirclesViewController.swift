//
//  CirclesViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit

class CirclesViewController: UIViewController {
    
    let circlesLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        circlesLabel.font = UIFont.boldSystemFont(ofSize: 25)
        circlesLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        circlesLabel.text = "Circles"
        circlesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circlesLabel)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            circlesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            circlesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }

}
