//
//  TabbarViewController.swift
//  Note
//
//  Created by Sauth.P on 19/5/24.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpTabBar()
        self.tabBar.barTintColor = .systemBackground
        self.tabBar.backgroundColor = .systemBackground


    }
    

    private func setUpTabBar() {
        
        let noteViewController = NoteViewController()
        let settingViewController = SettingViewController()
        
        viewControllers = [
            createTabBar(title: "Note", image: UIImage(systemName: "folder.fill")!, vc: noteViewController),
            createTabBar(title: "Setting", image: UIImage(systemName: "gear")!, vc: settingViewController),
            
        ]
        
        
        
        
        
        
        
    }
    
    // create nav
    private func createTabBar( title: String, image: UIImage, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        return nav
    }

}
