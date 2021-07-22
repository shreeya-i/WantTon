//
//  HomeViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var createPostButton = UIButton()
    private var sampleimage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createPostButton.backgroundColor = UIColor(red: 123/255, green: 190/255, blue: 123/255, alpha: 1.0)
        createPostButton.setTitle("Create Listing", for: .normal)
        createPostButton.setTitleColor(UIColor.white, for: .normal)
        createPostButton.clipsToBounds = true
        createPostButton.layer.cornerRadius = 15
        createPostButton.translatesAutoresizingMaskIntoConstraints = false
        createPostButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        view.addSubview(createPostButton)
        
       // logo.image = UIImage(named: "hitchlogo.png")
        sampleimage.backgroundColor = .secondarySystemBackground
        sampleimage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(sampleimage)
        
        setUpConstraints()

        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            createPostButton.topAnchor.constraint(equalTo: sampleimage.bottomAnchor, constant: 50),
            createPostButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            createPostButton.widthAnchor.constraint(equalToConstant: 200),
            createPostButton.heightAnchor.constraint(equalToConstant: 70),
        ])
        
        NSLayoutConstraint.activate ([
            sampleimage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sampleimage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -70),
            sampleimage.heightAnchor.constraint(equalToConstant: 300),
            sampleimage.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    @objc func didTapButton() {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func hello() {
        let _ = "hi"
    }


}

extension HomeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        sampleimage.image = image
    }
}
