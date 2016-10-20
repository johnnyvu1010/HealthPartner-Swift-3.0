
//
//  AppointmentTableViewCell.swift
//  HealthPartner
//
//  Created by Admin on 04/10/2016.
//  Copyright © 2016 Yuki. All rights reserved.
//

import UIKit

class AppointmentTableViewCell: UITableViewCell {

    @IBOutlet weak var m_label: UILabel!
    
    @IBOutlet weak var d_label: UILabel!
    
    @IBOutlet weak var t_label: UILabel!
    
    @IBOutlet weak var n_label: UILabel!
    
    @IBOutlet weak var i_label: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
