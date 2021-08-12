//
//  CreatePostViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/23/21.
//

import UIKit

class CreatePostViewController: UIViewController {
    
    
    private var postImage = UIImageView()
    let enterCaption = UITextView()
    let cameraButton = UIButton()
    let backButton = UIButton()
    let postButton = UIButton()
    let circlesLabel = UILabel()
    
    var imageToPass = UIImage()
    
    let circleTableView = UITableView()
    let cellReuseIdentifier = "hello"
    var circleData : [Circle] = []
    var homeController: HomeViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white

        postImage.backgroundColor = .secondarySystemBackground
        postImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postImage)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.tintColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        view.addSubview(backButton)
        
        cameraButton.translatesAutoresizingMaskIntoConstraints = false
        cameraButton.tintColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        cameraButton.addTarget(self, action: #selector(didTapCamera), for: .touchUpInside)
        cameraButton.setImage(UIImage(systemName: "camera"), for: .normal)
        view.addSubview(cameraButton)
        
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.setTitleColor(UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0), for: .normal)
        postButton.addTarget(self, action: #selector(didTapPost), for: .touchUpInside)
        postButton.setTitle("Post", for: .normal)
        view.addSubview(postButton)
        
        enterCaption.translatesAutoresizingMaskIntoConstraints = false
        enterCaption.backgroundColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 0.2)
        enterCaption.keyboardType = UIKeyboardType.default
        enterCaption.font = UIFont.systemFont(ofSize: 16)
        view.addSubview(enterCaption)
        
        circlesLabel.text = "Add to Circles:"
        circlesLabel.font = UIFont.boldSystemFont(ofSize: 16)
        circlesLabel.textColor = UIColor(red: 45/225, green: 128/225, blue: 36/225, alpha: 1.0)
        circlesLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(circlesLabel)
        
        circleTableView.translatesAutoresizingMaskIntoConstraints = false
        circleTableView.register(AddToCircleTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        circleTableView.delegate = self
        circleTableView.dataSource = self
        view.addSubview(circleTableView)

        createDummyData()
        setUpConstraints()
    }
    
    func createDummyData() {
        let samplecircle1 = Circle(name: "Felipe Common Neighbors", image: "group1.jpeg")
        let samplecircle2 = Circle(name: "Cornell University", image: "group2.jpeg")
        let samplecircle3 = Circle(name: "Yale Neighborhood", image: "group3.jpeg")
        let samplecircle4 = Circle(name: "BU Food Exchange", image: "group4.jpeg")
        circleData = [samplecircle1, samplecircle2, samplecircle3, samplecircle4]
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate ([
                postImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                postImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
                postImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                postImage.heightAnchor.constraint(equalToConstant: 340)
            ])
        
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: postButton.bottomAnchor, constant: -6),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            cameraButton.bottomAnchor.constraint(equalTo: postButton.bottomAnchor, constant: -6),
            cameraButton.trailingAnchor.constraint(equalTo: postButton.leadingAnchor, constant: -17)
        ])
        
        NSLayoutConstraint.activate([
            enterCaption.topAnchor.constraint(equalTo: postImage.bottomAnchor),
            enterCaption.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            enterCaption.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            enterCaption.heightAnchor.constraint(equalToConstant: 80),
            ])
        
        NSLayoutConstraint.activate([
            circlesLabel.topAnchor.constraint(equalTo: enterCaption.bottomAnchor, constant: 30),
            circlesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            circleTableView.topAnchor.constraint(equalTo: circlesLabel.bottomAnchor, constant: 12),
            circleTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            circleTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            circleTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
    }
    
    @objc func didTapCamera() {
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.allowsEditing = true
            picker.delegate = self
            present(picker, animated: true)
    }
    
    @objc func didTapPost() {
        let newPost = Post(user: "hello", image: "avocadoes.jpeg", caption: "fhdj", distance: "", address: "")
        homeController!.postData.insert(newPost, at: 0)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func didTapBack() {
        navigationController?.popViewController(animated: true)
    }
    
}

extension CreatePostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        
//        self.imageToPass = image
//        self.performSegue(withIdentifier: "goToNextView", sender: self)
        postImage.image = image
    }
    
//    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if segue.identifier == "goToNextView" {
//            let nextView: TabBarViewController = segue.destinationViewController as NextViewController
//            nextView.imagePassed = self.imageToPass
//        }
//    }
}

extension CreatePostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

extension CreatePostViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return circleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = circleTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! AddToCircleTableViewCell
        let circle = circleData[indexPath.row]
        cell.configure(with: circle)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
