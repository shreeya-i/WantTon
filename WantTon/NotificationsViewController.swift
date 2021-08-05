//
//  NotificationsViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit
import UserNotifications

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    

    private let tableView: UITableView = {
        let tableView = UITableView()
//        tableView.isHidden = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
//    private let spinner: UIActivityIndicatorView = {
//        let spinner = UIActivityIndicatorView(style: .large)
//        spinner.hidesWhenStopped = true
//        spinner.tintColor = .label
//        return spinner
//    }()
    
    private lazy var noNotificationsView = NoNotificationsView()
    
    let notificationsLabel = UILabel()
    let todaylabel = UILabel()
    let line1 = UIView()
    let notif1 = UILabel()
    let time1 = UILabel()
    let notif2 = UILabel()
    let time2 = UILabel()
    let image2 = UIImageView()
    let notif3 = UILabel()
    let time3 = UILabel()
    let image3 = UIImageView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notifications"
        view.backgroundColor = .white
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        view.insertSubview(backgroundImage, at: 0)
//        view.addSubview(spinner)
//        spinner.startAnimating()
        view.addSubview(noNotificationsView)
        tableView.delegate = self
        tableView.dataSource = self
     
        setUpViews()
        setUpConstraints()
        localNotify()
        
    }
    
//    private func addNoNotificationsView() {
//        tableView.isHidden = true
//        view.addSubview(tableView)
//        noNotificationsView.frame = CGRect(x: 0, y: 0, width: view.width/2, height: view.width/4)
//        noNotificationsView.center = view.center
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        noNotificationsView.frame = CGRect(x: 0, y: 0, width: view.width/2, height: view.width/4)
        noNotificationsView.center = view.center
//        spinner.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        spinner.center = view.center
    }
    
    func setUpViews() {
        notificationsLabel.font = UIFont.boldSystemFont(ofSize: 25)
        notificationsLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        notificationsLabel.text = "Notifications"
        notificationsLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notificationsLabel)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            notificationsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 35),
            notificationsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
    }
    
    func localNotify() {
        // Asking for permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
        }
        
        // Creating notification content
        let content = UNMutableNotificationContent()
        content.title = "New Notification Alert"
        content.body = "Open the app WanTon!"
        
        // Creating notification trigger
        let date = Date().addingTimeInterval(5)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Creating request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
    
        // Registering the request
        center.add(request) { (error) in
            // check error parameter and handle any errors
        }
    }
    
}
