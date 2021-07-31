//
//  NotificationsViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit
import UserNotifications

class NotificationsViewController: UIViewController {
    
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
        view.backgroundColor = .white
     
        setUpViews()
        setUpConstraints()
        
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
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Creating request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
    
        // Registering the request
        center.add(request) { (error) in
            // check error parameter and handle any errors
        }
        
    
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
    
}
