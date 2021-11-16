//
//  SignUpViewController.swift
//  TwitterClone
//
//  Created by Tunmice on 15/11/2021.
//

import UIKit

class SignUpViewController: UIViewController, UINavigationControllerDelegate {
    
    
    private let imagePiccker = UIImagePickerController()
    
    let addPhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "plus_photo"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(addPhotosTapped), for: .touchUpInside)
        
        return button
    }()
    
    
    private lazy var emailContainerView: UIView = {
       
        let image = UIImage(named: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainerView(withImage: image!, textField: emailTF)
        
        
        
        return view
    }()
    private lazy var passwordContainerView: UIView = {
       
        let image = UIImage(named: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image!, textField: passwordTF)
        
        
        
        return view
    }()
    private lazy var fullnameContainerView: UIView = {
       
        let image = UIImage(named: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image!, textField: fullnameTF)
        
        
        
        return view
    }()
    private lazy var usernameContainerView: UIView = {
       
        let image = UIImage(named: "ic_person_outline_white_2x")
        let view = Utilities().inputContainerView(withImage: image!, textField: usernameTF)
        
        
        
        return view
    }()
    
    private lazy var emailTF: UITextField = {
        let tf = Utilities().textField(withPlaceHolder: "Email")
       
        return tf
    }()
    private lazy var passwordTF: UITextField = {
        let tf = Utilities().textField(withPlaceHolder: "Password")
        tf.isSecureTextEntry = true
        return tf
    }()
    private lazy var fullnameTF: UITextField = {
        let tf = Utilities().textField(withPlaceHolder: "Full Name")
       
        return tf
    }()
    private lazy var usernameTF: UITextField = {
        let tf = Utilities().textField(withPlaceHolder: "Username")
       
        return tf
    }()
  
    private let signupButton: UIButton = {
        let button = Utilities().actionButtons(withTitle: "Sign Up")
        button.addTarget(self, action: #selector(signupTapped), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Have an account?", " Sign In")
        button.addTarget(self, action: #selector(alreadyHaveTapped), for: .touchUpInside)
        
        return  button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

      configureUI()
    }
    func configureUI() {
        view.backgroundColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isHidden = true
        
        imagePiccker.delegate = self
        imagePiccker.allowsEditing = true
        
        view.addSubview(addPhotoButton)
        view.addSubview(alreadyHaveAccountButton)
        addPhotoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor, paddingTop: 20)
        addPhotoButton.setDimensions(width: 150, height: 150)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingBottom: 25, paddingRight: 40)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, fullnameContainerView, usernameContainerView, signupButton])
        stack.axis = .vertical
        stack.spacing = 15
        view.addSubview(stack)
        stack.anchor(top: addPhotoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 30, paddingRight: 30)
        
       
        
    }
    
    //MARK: - Selectors

    @objc func alreadyHaveTapped() {
        navigationController?.popViewController(animated: true)
    }
    @objc func signupTapped() {
        
    }
    
    @objc func addPhotosTapped() {
        present(imagePiccker, animated: true, completion: nil)
    }

}

extension SignUpViewController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else {return}
        self.addPhotoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        addPhotoButton.layer.cornerRadius = 150/2
        addPhotoButton.layer.masksToBounds = true
        addPhotoButton.imageView?.contentMode = .scaleAspectFit
        addPhotoButton.imageView?.clipsToBounds = true
        addPhotoButton.layer.borderColor = UIColor.white.cgColor
        
        addPhotoButton.layer.borderWidth = 3
        dismiss(animated: true, completion: nil)
    }
}
