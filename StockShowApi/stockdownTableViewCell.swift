//
//  stockdownTableViewCell.swift
//  stockdownTableViewCell
//
//  Created by water on 2021/9/5.
//

import UIKit

class stockdownTableViewCell: UITableViewCell {

    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var downLabel: UILabel!
    @IBOutlet weak var rationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
