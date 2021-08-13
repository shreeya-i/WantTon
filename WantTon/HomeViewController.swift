//
//  HomeViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit

class HomeViewController: UIViewController, UITextFieldDelegate {

    private var createPostButton = UIButton()
    let postsTableView = UITableView()
    let cellReuseIdentifier = "hello"
    
    var postData : [Post] = []
    var filteredData : [Post] = []
    var filtered = false
    let searchField = UITextField()
    
    override func viewWillAppear(_ animated: Bool) {
            postsTableView.reloadData()
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createDummyData()
        setUpViews()
        setUpConstraints()

        // Do any additional setup after loading the view.
    }
    
    func createDummyData() {
        let samplepost = Post(user: "Jenny Doe", image: "carrots.jpeg", caption: "homegrown carrots", distance: "< 1 mile away", address: "342 Monroe Blvd")
        let samplepost2 = Post(user: "Rick Morty", image: "potatoes.jpeg", caption: "Potatoes, grown in our own backyard", distance: "2 miles away", address: "Pacific Commons Starbucks")
        let samplepost3 = Post(user: "Belle Ta Ko", image: "avocadoes.jpeg", caption: "Avocadoes! bought too many by accident", distance: "1.5 miles away", address: "Pacific Commons Starbucks")
        let samplepost4 = Post(user: "Jonah Arizona", image: "bread.jpeg", caption: "freshly baked sourdough bread", distance: "< 1 mile away", address: "Pacific Commons Starbucks")
        let samplepost5 = Post(user: "Teri Dactyl", image: "tomatoes.jpeg", caption: "tomatoes, have some unripe ones too", distance: "< 1 mile away", address: "Pacific Commons Starbucks")
        let samplepost6 = Post(user: "Usnavi Alnigh", image: "grains.jpeg", caption: "grains! unsure what they are", distance: "2 miles away", address: "Pacific Commons Starbucks")
        let samplepost7 = Post(user: "Annie Smith", image: "eggs.jpeg", caption: "Eggs from my chicken", distance: "1.5 miles away", address: "Pacific Commons Starbucks")
        postData = [samplepost4, samplepost, samplepost5, samplepost6, samplepost3, samplepost2, samplepost7]
    }
    
    func setUpViews() {
        
        searchField.translatesAutoresizingMaskIntoConstraints = false
        searchField.borderStyle = UITextField.BorderStyle.roundedRect
        searchField.keyboardType = UIKeyboardType.default
        //searchField.placeholder = UIImage(named: "search")
        searchField.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        searchField.delegate = self
        view.addSubview(searchField)
        
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        postsTableView.delegate = self
        postsTableView.dataSource = self
        view.addSubview(postsTableView)
        
        createPostButton.translatesAutoresizingMaskIntoConstraints = false
        createPostButton.tintColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        createPostButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        createPostButton.setImage(UIImage(systemName: "plus"), for: .normal)
        view.addSubview(createPostButton)

    }
    
    func setUpConstraints() {
       
        NSLayoutConstraint.activate ([
            searchField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchField.topAnchor.constraint(equalTo: createPostButton.topAnchor),
            searchField.heightAnchor.constraint(equalToConstant: 37),
            searchField.widthAnchor.constraint(equalToConstant: 280)
        ])
        
        NSLayoutConstraint.activate([
            createPostButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            createPostButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            postsTableView.topAnchor.constraint(equalTo: searchField.bottomAnchor, constant: 15),
            postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
        for post in postData{
            if (post.caption.lowercased().starts(with: query.lowercased()) || post.user.lowercased().starts(with: query.lowercased())){
                filteredData.append(post)
            }
        }
        postsTableView.reloadData()
        filtered = true
    }
    
    
    @objc func didTapButton() {
        let createPost = CreatePostViewController()
        createPost.homeController = self
        navigationController?.pushViewController(createPost, animated: true)
    }

}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
        let post = postData[indexPath.row]
        let vc = SinglePostViewController()
        self.present(vc, animated: true) {
            vc.configure(with: post)
        }
        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !filteredData.isEmpty{
            return filteredData.count
        }
        return filtered ? 0 : postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! PostTableViewCell
        if !filteredData.isEmpty {
            let post = filteredData[indexPath.row]
            cell.configure(with: post)
        }
        else {
            let post = postData[indexPath.row]
            cell.configure(with: post)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 520
    }
}

