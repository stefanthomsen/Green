//
//  Global.swift
//  Green
//
//  Created by Stefan Thomsen on 21/08/18.
//  Copyright © 2018 CreativeDev. All rights reserved.
//

import Foundation
import RealmSwift

@objc class Global:NSObject {
    
    static let shared = Global()
    
    @objc func getUser()->User?{
        do{
            let realm = try Realm()
            let user = realm.objects(User.self).first
            return user
        }catch let error{
            print("error: \(error)")
        }
        return nil
    }
    
    func save(user:User, completionHandler:(_ success:Bool,_ error:Error?) -> Void){
        do{
            let realm = try Realm()
            try realm.write {
                realm.add(user)
            }
            completionHandler(true, nil)
        }catch let error{
            print("ERROR: \(error)")
            completionHandler(false,error)
        }
    }
}
