//
//  methodRoom.swift
//  appChat
//
//  Created by LE An on 8/9/18.
//  Copyright © 2018 LEAN. All rights reserved.
//

import Foundation
class Room{
    var nameRoom: String
    var mess:String
    var idPerson : String
    init(nameRoom:String,mess:String, idPerson:String){
        self.nameRoom = nameRoom
        self.mess = mess
        self.idPerson = idPerson
    }
}
