//
//  TableViewCell.swift
//  UITableView
//
//  Created by Phạm Huy on 5/22/19.
//  Copyright © 2019 Phạm Huy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Anh_img: UIImageView!
    @IBOutlet weak var text_Lable: UILabel!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
