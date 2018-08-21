//
//  UIViewControllerExtension.swift
//  Green
//
//  Created by Stefan Thomsen on 21/08/18.
//  Copyright © 2018 CreativeDev. All rights reserved.
//

import Foundation

extension UIViewController{
    @objc func presentHomeViewController(){
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let tvc = storyboard.instantiateInitialViewController()
        self.navigationController?.setViewControllers([tvc!], animated: true)
    }
}
