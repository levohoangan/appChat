//
//  methodUser.swift
//  appChat
//
//  Created by LE An on 8/3/18.
//  Copyright © 2018 LEAN. All rights reserved.
//

import Foundation
class User{
    var email: String!
    var pass:String!
    var nickname: String!
    var id:String!
    var db:String?
    
    init(email :String,pass: String, nickname:String,id : String, dataofbirth : String? ) {
        self.email = email
        self.pass = pass
        self.nickname = nickname
        self.id = id
        self.db = dataofbirth ?? ""
    }

    
}
