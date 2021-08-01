//
//  JoinCirclesViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/29/21.
//

import UIKit

class JoinCirclesViewController: UIViewController {
    
    let backButton = UIButton()
    
    let circleTableView = UITableView()
    let cellReuseIdentifier = "hello"
    var circleData : [Circle] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        view.addSubview(backButton)
        
        circleTableView.translatesAutoresizingMaskIntoConstraints = false
        circleTableView.register(JoinCirclesTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        circleTableView.delegate = self
        circleTableView.dataSource = self
        view.addSubview(circleTableView)
        
        setUpDummyData()
        setUpConstraints()
    }
    
    func setUpDummyData(){
        let samplecircle1 = Circle(name: "Felipe Common Neighbors", image: "group1.jpeg")
        let samplecircle2 = Circle(name: "Cornell University", image: "group2.jpeg")
        let samplecircle3 = Circle(name: "Yale Neighborhood", image: "group3.jpeg")
        let samplecircle4 = Circle(name: "BU Food Exchange", image: "group4.jpeg")
        circleData = [samplecircle1, samplecircle2, samplecircle3, samplecircle4, samplecircle1, samplecircle2, samplecircle3, samplecircle4]
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            circleTableView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 30),
            circleTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            circleTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            circleTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }

}

extension JoinCirclesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension JoinCirclesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return circleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = circleTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! JoinCirclesTableViewCell
        let circle = circleData[indexPath.row]
        cell.configure(with: circle)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
