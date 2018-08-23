//
//  TableViewCell.swift
//  appChat
//
//  Created by LE An on 8/6/18.
//  Copyright © 2018 LEAN. All rights reserved.
//

import UIKit
class TableViewCell: UITableViewCell {

    @IBOutlet weak var mess: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
