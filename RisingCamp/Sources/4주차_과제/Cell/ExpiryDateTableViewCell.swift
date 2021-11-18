//
//  ExpiryDateTableViewCell.swift
//  RisingCamp
//
//  Created by 이하연 on 2021/11/18.
//

import UIKit

class ExpiryDateTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ingredientImg: UIImageView!
    @IBOutlet weak var ingredientName: UILabel!
    @IBOutlet weak var statusLb: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
