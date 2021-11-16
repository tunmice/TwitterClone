//
//  MessagesViewController.swift
//  TwitterClone
//
//  Created by Tunmice on 13/11/2021.
//

import UIKit

class MessagesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        configureUI()
    }
    

    func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Messages"
    }
  

}
