//
//  Firebase.swift
//  Journeytags
//
//  Created by Stavros Filippidis on 2/22/16.
//  Copyright © 2016 Stavros Filippidis. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct FirebaseStruct {
    
    var ref = FIRDatabase.database().reference()
    
    static let userDefaults = UserDefaults.standard
}
