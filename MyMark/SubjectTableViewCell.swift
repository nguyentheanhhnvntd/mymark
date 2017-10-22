//
//  SubjectTableViewCell.swift
//  MyMark
//
//  Created by Thế Anh Nguyễn on 10/15/17.
//  Copyright © 2017 Thế Anh Nguyễn. All rights reserved.
//

import UIKit

class SubjectTableViewCell: UITableViewCell {

    @IBOutlet weak var subject: UILabel!
    
    @IBOutlet weak var scoreTen: UILabel!
    @IBOutlet weak var scoreFour: UILabel!
    @IBOutlet weak var scoreC: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
