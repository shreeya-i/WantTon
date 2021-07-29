//
//  CirclesViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit

class CirclesViewController: UIViewController {
    
    let joinButton = UIButton()
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
        circleTableView.register(CircleTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
//        circleTableView.delegate = self
        circleTableView.dataSource = self
        view.addSubview(circleTableView)
        
        joinButton.translatesAutoresizingMaskIntoConstraints = false
       // editButton.setTitleColor(UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0), for: .normal)
        joinButton.setTitleColor(.white, for: .normal)
        //joinButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        joinButton.setTitle("Log In", for: .normal)
        joinButton.clipsToBounds = true
        joinButton.layer.cornerRadius = 15
        joinButton.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(joinButton)
        
        createDummyData()
        setUpConstraints()
    }
    
    func createDummyData() {
        let samplecircle1 = Circle(name: "Neighborhood 1")
        let samplecircle2 = Circle(name: "Neighborhood 2")
        let samplecircle3 = Circle(name: "Neighborhood 3")
        let samplecircle4 = Circle(name: "Neighborhood 4")
        circleData = [samplecircle1, samplecircle2, samplecircle3, samplecircle4, samplecircle1, samplecircle2]
    }
    
    
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            circlesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            circlesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            circleTableView.topAnchor.constraint(equalTo: circlesLabel.bottomAnchor, constant: 50),
            circleTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            circleTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            circleTableView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate ([
            joinButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            joinButton.topAnchor.constraint(equalTo: circleTableView.bottomAnchor, constant: 30),
            joinButton.heightAnchor.constraint(equalToConstant: 40),
            joinButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }

}

extension CirclesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return circleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = circleTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! CircleTableViewCell
        let circle = circleData[indexPath.row]
        cell.configure(with: circle)
        return cell
    }
}
