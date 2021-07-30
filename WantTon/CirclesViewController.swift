//
//  CirclesViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit

class CirclesViewController: UIViewController, UITextFieldDelegate {
    
    let joinButton = UIButton()
    let circlesLabel = UILabel()
    let circleTableView = UITableView()
    let cellReuseIdentifier = "hello"
    
    var circleData : [Circle] = []
    var filteredData : [Circle] = []
    var filtered = false
    let searchField = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        circlesLabel.font = UIFont.boldSystemFont(ofSize: 25)
        circlesLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        circlesLabel.text = "Circles"
        circlesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circlesLabel)
        
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.borderStyle = UITextField.BorderStyle.roundedRect
        searchField.keyboardType = UIKeyboardType.default
        //searchField.placeholder = UIImage(named: "search")
        searchField.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        searchField.delegate = self
        view.addSubview(searchField)
        
        circleTableView.translatesAutoresizingMaskIntoConstraints = false
        circleTableView.register(CircleTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        circleTableView.delegate = self
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
        let samplecircle1 = Circle(name: "Felipe Common Neighbors")
        let samplecircle2 = Circle(name: "Cornell University")
        let samplecircle3 = Circle(name: "Yale Neighborhood")
        let samplecircle4 = Circle(name: "BU Food Exchange")
        circleData = [samplecircle1, samplecircle2, samplecircle3, samplecircle4]
    }
    
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            circlesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            circlesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate ([
            searchField.leadingAnchor.constraint(equalTo: circlesLabel.leadingAnchor),
            searchField.topAnchor.constraint(equalTo: circlesLabel.bottomAnchor, constant: 30),
            searchField.heightAnchor.constraint(equalToConstant: 45),
            searchField.widthAnchor.constraint(equalToConstant: 295)
        ])
        
        NSLayoutConstraint.activate([
            circleTableView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 50),
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
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = searchField.text {
            if string.count == 0 {
                filterText(String(text.dropLast()))
            } else {
                filterText(text + string)
            }
        }
        return true
    }
    
    func filterText(_ query: String) {
        filteredData.removeAll()
        for circle in circleData{
            if circle.name.lowercased().starts(with: query.lowercased()){
                filteredData.append(circle)
            }
        }
        circleTableView.reloadData()
        filtered = true
    }

}


extension CirclesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension CirclesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty{
            return filteredData.count
        }
        return filtered ? 0 : circleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = circleTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! CircleTableViewCell
        if !filteredData.isEmpty {
            let circle = filteredData[indexPath.row]
            cell.configure(with: circle)
        }
        else {
            let circle = circleData[indexPath.row]
            cell.configure(with: circle)
        }
        return cell
    }
}
