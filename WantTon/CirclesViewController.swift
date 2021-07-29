//
//  CirclesViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit

class CirclesViewController: UIViewController {
    
    let circleTableView = UITableView()
    let cellReuseIdentifier = "hello"
    var circleData : [Circle] = []
    
    let circlesLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        circlesLabel.font = UIFont.boldSystemFont(ofSize: 25)
        circlesLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        circlesLabel.text = "Circles"
        circlesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circlesLabel)
        
        circleTableView.translatesAutoresizingMaskIntoConstraints = false
        //circleTableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
//        circleTableView.delegate = self
//        circleTableView.dataSource = self
        view.addSubview(circleTableView)
        
        createDummyData()
        setUpConstraints()
    }
    
    func createDummyData() {
        
    }
    
    
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            circlesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            circlesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }

}
