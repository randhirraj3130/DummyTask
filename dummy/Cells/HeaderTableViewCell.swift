//
//  HeaderTableViewCell.swift
//  dummy
//
//  Created by admin on 24/02/2021.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var arrowButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func tapArrow(_ sender: Any) {
    }
}
