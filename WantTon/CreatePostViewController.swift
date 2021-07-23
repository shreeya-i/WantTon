//
//  CreatePostViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/23/21.
//

import UIKit

class CreatePostViewController: UIViewController {
    
    private var sampleimage = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let picker = UIImagePickerController()
               picker.sourceType = .camera
               picker.allowsEditing = true
               picker.delegate = self
               present(picker, animated: true)
        
        sampleimage.backgroundColor = .secondarySystemBackground
             sampleimage.translatesAutoresizingMaskIntoConstraints = false
             view.addSubview(sampleimage)

        setUpConstraints()
    }
    
    func setUpConstraints() {
                NSLayoutConstraint.activate ([
                    sampleimage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    sampleimage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -200),
                    sampleimage.heightAnchor.constraint(equalToConstant: 200),
                    sampleimage.widthAnchor.constraint(equalToConstant: 200)
                ])
        
    }
    

}

extension CreatePostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

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
