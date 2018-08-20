//
//  User.swift
//  Green
//
//  Created by Stefan Thomsen on 21/08/18.
//  Copyright © 2018 CreativeDev. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name:String? = nil
    @objc dynamic var password:String? = nil
}
