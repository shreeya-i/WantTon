//
//  ProfileViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit
import FirebaseDatabase

private var postsView: UICollectionView!
private var posts: [Post] = []
private let cellPadding: CGFloat = 8
private let sectionPadding: CGFloat = 4
private let cellReuseIdentifier = "hello"

class ProfileViewController: UIViewController {
    
    let currentpfp = UIImageView(frame: CGRect(x: 0,y: 0,width: 100,height: 100))
    let nameLabel = UILabel()
    let cityLabel = UILabel()
    let samplepost = Post(image: "carrots.jpeg", caption: "homegrown carrots")
    let samplepost2 = Post(image: "potatoes.jpeg", caption: "homegrown potatoes")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
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
            currentpfp.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            currentpfp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
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
        
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate ([
            postsView.topAnchor.constraint(equalTo: currentpfp.bottomAnchor, constant: 50),
            postsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: collectionViewPadding),
            postsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            postsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding),
        ])
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
