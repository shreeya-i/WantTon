//
//  ProfileViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit
// import FirebaseDatabase

private var postsView: UICollectionView!
private var posts: [Post] = []
private let cellPadding: CGFloat = 8
private let sectionPadding: CGFloat = 4
private let cellReuseIdentifier = "hello"

protocol ProfileDelegate: AnyObject {
   // func changePfp(newPfp: String)
    func changeName(newName: String)
    func changeCity(newCity: String)
}

class ProfileViewController: UIViewController {
    
    let currentpfp = UIImageView(frame: CGRect(x: 0,y: 0,width: 100,height: 100))
    let nameLabel = UILabel()
    let cityLabel = UILabel()
    let editButton = UIButton()
    let reviewsLabel = UILabel()
    let stars = UIImageView()
    let transactionCount = UILabel()
    
    let samplepost = Post(user: "Tyler Creator", image: "carrots.jpeg", caption: "homegrown carrots", distance: "", address: "Times Square")
    let samplepost2 = Post(user: "Tyler Creator", image: "potatoes.jpeg", caption: "3 potatoes", distance: "", address: "Times Square")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
      //  self.navigationController?.isNavigationBarHidden = true
        
        posts = [samplepost, samplepost2, samplepost, samplepost, samplepost2, samplepost, samplepost2]
        
        currentpfp.layer.masksToBounds = false
        currentpfp.layer.cornerRadius = currentpfp.frame.height/2
        currentpfp.clipsToBounds = true
        currentpfp.translatesAutoresizingMaskIntoConstraints = false
        currentpfp.image = UIImage(named: "defaultpfp.jpeg")
        view.addSubview(currentpfp)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.text = "Tyler Creator"
        view.addSubview(nameLabel)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.systemFont(ofSize: 16)
        cityLabel.text = "New York City, NY"
        cityLabel.textColor = .darkGray
        view.addSubview(cityLabel)
        
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.setTitleColor(UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0), for: .normal)
        //editButton.setTitleColor(.white, for: .normal)
        editButton.addTarget(self, action: #selector(pushButtonPressed), for: .touchUpInside)
        editButton.setTitle("Edit", for: .normal)
       // editButton.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        view.addSubview(editButton)
        
        reviewsLabel.translatesAutoresizingMaskIntoConstraints = false
        reviewsLabel.font = UIFont.boldSystemFont(ofSize: 18)
        reviewsLabel.text = "Reviews:"
        view.addSubview(reviewsLabel)
        
        stars.translatesAutoresizingMaskIntoConstraints = false
        stars.image = UIImage(named: "stars")
        view.addSubview(stars)
        
        transactionCount.translatesAutoresizingMaskIntoConstraints = false
        transactionCount.font = UIFont.systemFont(ofSize: 16)
        transactionCount.text = "You have \(posts.count) transactions"
        view.addSubview(transactionCount)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = cellPadding
        layout.minimumLineSpacing = cellPadding
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)

        postsView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        postsView.translatesAutoresizingMaskIntoConstraints = false
        postsView.backgroundColor = .clear
        view.addSubview(postsView)
        
        postsView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        postsView.dataSource = self
        postsView.delegate = self
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            currentpfp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            currentpfp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            currentpfp.widthAnchor.constraint(equalToConstant: 100),
            currentpfp.heightAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate ([
            nameLabel.topAnchor.constraint(equalTo: currentpfp.topAnchor, constant: 22),
            nameLabel.leadingAnchor.constraint(equalTo: currentpfp.trailingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate ([
            cityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            cityLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate ([
            reviewsLabel.topAnchor.constraint(equalTo: currentpfp.bottomAnchor, constant: 25),
            reviewsLabel.leadingAnchor.constraint(equalTo: currentpfp.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stars.topAnchor.constraint(equalTo: reviewsLabel.topAnchor, constant: -4),
            stars.leadingAnchor.constraint(equalTo: reviewsLabel.trailingAnchor, constant: 10),
            stars.widthAnchor.constraint(equalToConstant: 100),
            stars.heightAnchor.constraint(equalToConstant: 30)
            ])
        
        NSLayoutConstraint.activate ([
            transactionCount.topAnchor.constraint(equalTo: reviewsLabel.bottomAnchor, constant: 15),
            transactionCount.leadingAnchor.constraint(equalTo: currentpfp.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            editButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
          //  editButton.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate ([
            postsView.topAnchor.constraint(equalTo: transactionCount.bottomAnchor, constant: 25),
            postsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: collectionViewPadding),
            postsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            postsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding),
        ])
    }
    
    @objc func pushButtonPressed() {
        let pushViewController = EditProfileViewController()
        navigationController?.pushViewController(pushViewController, animated: true)
        pushViewController.delegate = self
    }

}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! PostCollectionViewCell
        cell.configure(for: posts[indexPath.item])
        return cell
    }
    
    
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (postsView.frame.width - cellPadding) / 2
        return CGSize(width: size, height: size)
    }
}

extension ProfileViewController: ProfileDelegate {
//    func changePfp(newPfp: String){
//        currentpfp.image = (UIImage(named: newPfp))
//    }
    func changeName(newName: String){
        nameLabel.text = newName
    }
    func changeCity(newCity: String) {
        cityLabel.text = newCity
    }
}
