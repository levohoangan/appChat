//
//  FireBaseData.swift
//  appChat
//
//  Created by LE An on 8/3/18.
//  Copyright © 2018 LEAN. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase
 let DB_BASE = Database.database().reference()

class wrData {
    var a : Int!
    
    static let shared = wrData()
    func random(_ n: Int) -> String
    {
        let a = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
        
        var s = ""
        
        for _ in 0..<n
        {
            let r = Int(arc4random_uniform(UInt32(a.characters.count)))
            
            s += String(a[a.index(a.startIndex, offsetBy: r)])
        }
        
        return s
    }
    func writeData(method : User!) {
        let a = "\(random(4))"
        DB_BASE.child("user").child(a).child("email").setValue(method.email)
        DB_BASE.child("user").child(a).child("pass").setValue(method.pass)
        DB_BASE.child("user").child(a).child("id").setValue(a)
        DB_BASE.child("user").child(a).child("nickname").setValue(method.nickname)
        DB_BASE.child("user").child(a).child("db").setValue(method.db)
//        DB_BASE.child("lobby").child("00000").child("messager").child(method.id).setValue("1")
    }
    func writeDataInLobby(method : Room,people : [User]){
        DB_BASE.child("lobby").child(method.nameRoom).child("messager").setValue(people)
    }
    func writeDataInMainLobby(room : Room) {
        DB_BASE.child("lobby").child("00000").child("messager").child(room.idPerson).setValue(room.mess)
    }
    func getIDUser(pass: String!){
        DB_BASE.child("user").observeSingleEvent(of: .value, with: { (dataSnapshot) in
            if let userDict = dataSnapshot.value as? [String:Any] {
                //Do not cast print it directly may be score is Int not string
                for id in userDict{
                    
                    if let a = id.value as? [String:Any]{
                        print(a["pass"] as! String)
                    if pass == (a["pass"] as! String) {
                        print(id.key)
                        
                        }
                        
                    }
                }
                
            }
        }) { (err) in
            print("faile")
        }
    }
}
