//
//  TabBarViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()


        let vc1 = HomeViewController()
        let vc2 = NotificationsViewController()
        let vc4 = CirclesViewController()
        let vc5 = ProfileViewController()
        
        self.setViewControllers([vc1, vc2, vc4, vc5], animated: false)
        
        guard let items = self.tabBar.items else { return }
        let images = ["house", "bell", "circle", "person"]
        
        for x in 0...3{
            items[x].image = UIImage(systemName: images[x])
        }
        
        self.tabBar.tintColor = .init(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        
      
    }
    

}
