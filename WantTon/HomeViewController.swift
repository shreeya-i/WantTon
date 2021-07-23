//
//  HomeViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var createPostButton = UIButton()
    let postsTableView = UITableView()
    let cellReuseIdentifier = "hello"
    
    var postData : [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createDummyData()
        setUpViews()
        setUpConstraints()

        // Do any additional setup after loading the view.
    }
    
    func createDummyData() {
        let samplepost = Post(user: "Jennifer Doe", image: "carrots.jpeg", caption: "homegrown carrots")
        let samplepost2 = Post(user: "Rick Morty", image: "potatoes.jpeg", caption: "3 potatoes")
        postData = [samplepost, samplepost2, samplepost, samplepost, samplepost2, samplepost, samplepost2]
    }
    
    func setUpViews() {
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
   //     postsTableView.delegate = self
        postsTableView.dataSource = self
        view.addSubview(postsTableView)
        
        createPostButton.translatesAutoresizingMaskIntoConstraints = false
        createPostButton.tintColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        createPostButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        createPostButton.setImage(UIImage(systemName: "plus"), for: .normal)
        view.addSubview(createPostButton)

    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            createPostButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            createPostButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            postsTableView.topAnchor.constraint(equalTo: createPostButton.bottomAnchor, constant: 10),
            postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }
    
    
    @objc func didTapButton() {
        let pushViewController = CreatePostViewController()
        self.present(pushViewController, animated: true, completion: nil)

    }

}

//extension HomeViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cell = tableView.cellForRow(at: indexPath) as! PostTableViewCell
//        let postObject = postData[indexPath.row]
//    }
//}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = postsTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! PostTableViewCell
        let post = postData[indexPath.row]
        cell.configure(with: post)
        return cell
    }
}
