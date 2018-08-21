//
//  HomeViewController.swift
//  Green
//
//  Created by Stefan Thomsen on 20/08/18.
//  Copyright © 2018 CreativeDev. All rights reserved.
//

import Foundation
import RealmSwift
import Kingfisher

@objc class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView:UICollectionView!
    
    lazy var context:NSManagedObjectContext = {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }()
    
    var data:[String] = [String]()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        
        self.saveMockdata()
        
        self.loadData()
    }
    
    private func loadData(){
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            var stringArray:[String] = []
            for data in result as! [NSManagedObject] {
                if let url = data.value(forKey: "url") as? String{
                    stringArray.append(url)
                }
            }
            self.data = stringArray
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        } catch {
            print("Failed")
        }
    }
    
    private func saveMockdata(){
        self.clearDataBase()
        
        let entity = NSEntityDescription.entity(forEntityName: "Image", in: context)
        
        let image1 = NSManagedObject(entity: entity!, insertInto: context)
        image1.setValue("https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Hopetoun_falls.jpg/600px-Hopetoun_falls.jpg", forKey: "url")
        
        let image2 = NSManagedObject(entity: entity!, insertInto: context)
        image2.setValue("https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Bachalpsee_reflection.jpg/600px-Bachalpsee_reflection.jpg", forKey: "url")
        
        let image3 = NSManagedObject(entity: entity!, insertInto: context)
        image3.setValue("https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Galunggung.jpg/600px-Galunggung.jpg", forKey: "url")
        
        let image4 = NSManagedObject(entity: entity!, insertInto: context)
        image4.setValue("https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/KERALA_-_32.jpg/600px-KERALA_-_32.jpg", forKey: "url")
        
        let image5 = NSManagedObject(entity: entity!, insertInto: context)
        image5.setValue("https://upload.wikimedia.org/wikipedia/commons/thumb/9/97/The_Earth_seen_from_Apollo_17.jpg/400px-The_Earth_seen_from_Apollo_17.jpg", forKey: "url")
        
        let image6 = NSManagedObject(entity: entity!, insertInto: context)
        image6.setValue("https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Top_of_Atmosphere.jpg/440px-Top_of_Atmosphere.jpg", forKey: "url")
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        
    }
    
    private func clearDataBase(){
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Image")
        let request = NSBatchDeleteRequest(fetchRequest: fetch)
        do {
            try context.execute(request)
        } catch {
            print("Failed clearing database")
        }
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tile", for: indexPath) as! TileCollectionViewCell
        if let url = URL(string: data[indexPath.row]){
            cell.tileImageView.kf.setImage(with: url)
        }
        return cell
    }
    
}
