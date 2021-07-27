//
//  SinglePostViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/27/21.
//

import UIKit

class SinglePostViewController: UIViewController {
    
    let name = UILabel()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

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
    
    func configure(with post: Post){
        name.text = post.user
    }

}
