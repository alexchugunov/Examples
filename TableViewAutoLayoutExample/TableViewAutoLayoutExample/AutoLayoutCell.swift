//
//  AutoLayoutCell.swift
//  TableViewAutoLayoutExample
//
//  Created by Alex Chugunov on 3/1/15.
//
//

import UIKit

class AutoLayoutCell: UITableViewCell {
    @IBOutlet weak var label: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setTitle(title: String?) {
        label?.text = title;
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
