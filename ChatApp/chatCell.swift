//
//  chatCell.swift
//  ChatApp
//
//  Created by Areej Mohammad on 03/05/1443 AH.
//

import UIKit

class chatCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var mImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
