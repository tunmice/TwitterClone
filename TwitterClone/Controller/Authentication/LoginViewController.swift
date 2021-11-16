//
//  LoginViewController.swift
//  TwitterClone
//
//  Created by Tunmice on 15/11/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    let logoImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.image = UIImage(named: "TwitterLogo")
        return image
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
    
    private lazy var emailTF: UITextField = {
        let tf = Utilities().textField(withPlaceHolder: "Email")
       
        return tf
    }()
    
    private lazy var passwordTF: UITextField = {
        let tf = Utilities().textField(withPlaceHolder: "Password")
        tf.isSecureTextEntry = true
       
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = Utilities().actionButtons(withTitle: "Log In")
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Don't have an account?", " Sign Up")
        button.addTarget(self, action: #selector(dontHaveTapped), for: .touchUpInside)
        
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
        
        view.addSubview(logoImageView)
        logoImageView .centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        logoImageView.setDimensions(width: 150, height: 150)
        view.addSubview(dontHaveAccountButton)
       
        dontHaveAccountButton.anchor(left: view.leftAnchor ,bottom: view.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingBottom: 25, paddingRight: 40)
        
  let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        view.addSubview(stack)
        stack.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,   paddingLeft: 32, paddingRight: 32)
        
        
        
    }
    
    @objc func loginTapped() {
        
    }
    
    @objc func dontHaveTapped() {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

}
