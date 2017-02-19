//
//  ReminderTableViewCell.swift
//  treehacks17
//
//  Created by Mathias Klenk on 18/02/17.
//  Copyright © 2017 Mathias Klenk. All rights reserved.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {

    //Outlets
    
    @IBOutlet weak var notificationMarker: UIButton!
    @IBOutlet weak var notificationTitle: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
