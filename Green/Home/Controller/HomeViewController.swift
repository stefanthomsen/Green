//
//  HomeViewController.swift
//  Green
//
//  Created by Stefan Thomsen on 20/08/18.
//  Copyright © 2018 CreativeDev. All rights reserved.
//

import Foundation
import RealmSwift

@objc class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    var data:[String] = [String]()
    
    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(){
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
            self.presentLoginViewController()
        }catch let error{
            print("ERROR: \(error)")
        }
    }
    
    private func presentLoginViewController(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateInitialViewController()
        UIApplication.shared.keyWindow?.rootViewController = vc
        UIApplication.shared.keyWindow?.makeKeyAndVisible()
    }

}

extension HomeViewController:UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tile", for: indexPath)
        return cell
    }
    
}
