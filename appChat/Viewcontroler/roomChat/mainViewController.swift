//
//  mainViewController.swift
//  appChat
//
//  Created by LE An on 7/27/18.
//  Copyright © 2018 LEAN. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {
    
    var managerTable:[Any] = []
    var arrMemberInromm:[String] = []
    
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var messTF: UITextField!
    @IBOutlet weak var sendataToolBar: UIToolbar!
    @IBOutlet weak var tableChat: UITableView!
    override func viewDidLoad() {
        self.title = "Chat room"
        super.viewDidLoad()
        tableChat.delegate = self
        tableChat.delegate = self
        tableChat.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableChat.estimatedRowHeight = 100
        tableChat.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
 
    @IBAction func sendAction(_ sender: Any) {
        
    }
    
}
extension mainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return managerTable.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableChat.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
    
}
