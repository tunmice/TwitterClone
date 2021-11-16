//
//  MainTabBar.swift
//  TwitterClone
//
//  Created by Tunmice on 13/11/2021.
//

import UIKit

class MainTabBar: UITabBarController {
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(newTweetTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "new_tweet"), for: .normal)
        return button
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        configureVCs()
        configureUI()
        view.backgroundColor = .systemPink
       
       
    }
    
    func configureUI(){
        view.addSubview(actionButton)
       
      
        actionButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,  paddingBottom: 64, paddingRight: 17, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56/2
        actionButton.backgroundColor = UIColor.twitterBlue
    }
    
    func configureVCs() {
        let feed = FeedViewController()
        let nav1 = templateNav(image: UIImage(named: "home_unselected"), rootViewController: feed)
       
        
        
        let explore = ExploreViewController()
        let nav2 = templateNav(image: UIImage(named: "search_unselected"), rootViewController: explore)
       
        
        let notifications = NotificationsViewController()
        let nav3 = templateNav(image: UIImage(named: "like_unselected"), rootViewController: notifications)
        
        let messages = MessagesViewController()
        let nav4 = templateNav(image: UIImage(named: "ic_mail_outline_white_2x-1"), rootViewController: messages)
//
        viewControllers = [nav1, nav2, nav3, nav4]
        
//        viewControllers = [feed, explore, notifications, messages]
    }
    
    func templateNav(image: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        nav.navigationBar.titleTextAttributes = [.backgroundColor: UIColor.white]
        nav.navigationItem.title = "Twitter"
        return nav
    }
    
     @objc func newTweetTapped() {
        
    }

}
