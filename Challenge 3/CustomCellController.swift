//
//  CustomCellController.swift
//  Stack
//
//  Created by itst on 23/2/2016.
//  Copyright © 2016 IVE. All rights reserved.
//

import UIKit

class CustomCellController: UITableViewCell {


    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var btn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
