//
//  CheckBox.swift
//  HealthPartner
//
//  Created by Admin on 13/10/2016.
//  Copyright © 2016 Yuki. All rights reserved.
//

import UIKit

class CheckBox: UIButton {

    //images
    let checkedImage = UIImage(named: "checked_checkbox")
    let unCheckedImage = UIImage(named: "unchecked_checkbox")

    //bool propety
    var isChecked:Bool = false{
        didSet{
            if isChecked == true{
                self.setImage(checkedImage, for: UIControlState())
            }else{
                self.setImage(unCheckedImage, for: UIControlState())
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(CheckBox.buttonClicked(_:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
    }
    
    
    
    func buttonClicked(_ sender:UIButton) {
        if(sender == self){
            if isChecked == true{
                isChecked = false
            }else{
                isChecked = true
            }
        }
    }
    

}
