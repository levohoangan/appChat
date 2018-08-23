//
//  LoginViewController.swift
//  appChat
//
//  Created by LE An on 7/27/18.
//  Copyright © 2018 LEAN. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class LoginViewController: UIViewController {

    
    @IBOutlet weak var navigationLogin: UINavigationBar!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var nickName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var signUp: UIButton!
    
    var lbLogin:UILabel = {
        var lbel = UILabel()
        lbel.text = "Login :"
        return lbel
        }()
    var tfUser : UITextField = {
        var tf = UITextField()
        tf.text = "sad"
        return tf
    }()
    
    func autoLayout(){
        // lbLogin
        view.addSubview(lbLogin)
        view.addSubview(tfUser)
        lbLogin.translatesAutoresizingMaskIntoConstraints = false
        tfUser.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            lbLogin.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            lbLogin.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tfUser.leadingAnchor.constraint(equalTo: lbLogin.trailingAnchor, constant: 10 ),
            tfUser.topAnchor.constraint(equalTo: lbLogin.topAnchor, constant: 0),
            tfUser.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tfUser.widthAnchor.constraint(equalToConstant: 150)
            
            ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        autoLayout()


        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signIn(_ sender: Any) {
        let registerView = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        self.navigationController?.pushViewController(registerView, animated: true)
    }
    @IBAction func login(_ sender: Any) {
        if emailAddress.text == "" || passWord.text == "" || nickName.text == "" {
            let alertControll = UIAlertController(title: "ERR", message: "PLEASE ENTER EMAIL OR PASS", preferredStyle: .alert)
            let alertAction =   UIAlertAction(title: "oki", style: .cancel, handler: nil)
            alertControll.addAction(alertAction)
            self.present(alertControll, animated: true, completion: nil)
        }
        else {
            Auth.auth().createUser(withEmail: emailAddress.text!, password: passWord.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    
                    
                    
                    wrData.shared.writeData(method: User(email: self.emailAddress.text!, pass: self.passWord.text!, nickname: self.nickName.text!, id: "sdaa2f234" , dataofbirth: nil))
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
//                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
//                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
}
