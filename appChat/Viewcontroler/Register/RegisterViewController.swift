//
//  RegisterViewController.swift
//  appChat
//
//  Created by LE An on 8/1/18.
//  Copyright © 2018 LEAN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
class RegisterViewController: UIViewController {
    
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var passWord: UITextField!
    
    @IBOutlet weak var navigationLogin: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        Auth.auth().signIn(withEmail: Email.text!, password: passWord.text!) { (user, err) in
            if err == nil{
//                let alertcontrol = UIAlertController(title: "Congratiaion", message: " ", preferredStyle: .alert)
//                let actionalert = UIAlertAction(title: "Oki", style: .cancel , handler: nil)
//                alertcontrol.addAction(actionalert)
//                self.present(alertcontrol, animated: true, completion: nil)
                let mainVC = mainViewController(nibName: "mainViewController", bundle: nil)
               
                wrData.shared.getIDUser(pass: self.passWord.text!)
//                mainVC.arrMemberInromm.append()
                self.navigationController?.pushViewController(mainVC, animated: true)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
