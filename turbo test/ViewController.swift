//
//  ViewController.swift
//  turbo test
//
//  Created by Owen Roth on 2/7/23.
//

import UIKit

class ViewController: UINavigationController, UITabBarDelegate {
let tabBar = UITabBar()
    let itemHome = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
    let itemQuotes = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.frame = CGRect(x: 0, y: self.view.frame.height - 75, width: self.view.frame.width, height: 49)
        tabBar.items = [itemHome, itemQuotes]
        self.view.addSubview(tabBar)
        // Do any additional setup after loading the view.
    }


}

