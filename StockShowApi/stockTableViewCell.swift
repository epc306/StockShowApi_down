//
//  stockTableViewCell.swift
//  stockTableViewCell
//
//  Created by water on 2021/9/4.
//

import UIKit

class stockTableViewCell: UITableViewCell {
    
    @IBOutlet weak var companylabel: UILabel!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var upLabel: UILabel!
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
