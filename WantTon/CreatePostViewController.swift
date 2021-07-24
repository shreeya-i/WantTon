//
//  CreatePostViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/23/21.
//

import UIKit

class CreatePostViewController: UIViewController {
    
    //GONNA NEED TO SET UP A NEW CAMERA BUTTON!!
    
    private var postImage = UIImageView()
    let enterCaption = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
//        let picker = UIImagePickerController()
//               picker.sourceType = .camera
//               picker.allowsEditing = true
//               picker.delegate = self
//               present(picker, animated: true)

        postImage.backgroundColor = .secondarySystemBackground
        postImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(postImage)
        
        enterCaption.translatesAutoresizingMaskIntoConstraints = false
        enterCaption.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1.0)
        view.addSubview(enterCaption)

        setUpConstraints()
    }
    
    func setUpConstraints() {
                NSLayoutConstraint.activate ([
                    postImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    postImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
                    postImage.widthAnchor.constraint(equalToConstant: 250),
                    postImage.heightAnchor.constraint(equalToConstant: 250)
                ])
        
        NSLayoutConstraint.activate([
            enterCaption.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 10),
            enterCaption.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            enterCaption.widthAnchor.constraint(equalToConstant: 300),
            enterCaption.heightAnchor.constraint(equalToConstant: 200)
            ])
        
    }
    

}

//extension CreatePostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        picker.dismiss(animated: true, completion: nil)
//    }
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//
//        picker.dismiss(animated: true, completion: nil)
//        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
//            return
//        }
//        sampleimage.image = image
//    }
//}
