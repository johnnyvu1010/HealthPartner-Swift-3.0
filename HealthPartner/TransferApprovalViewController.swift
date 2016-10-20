//
//  TransferApprovalViewController.swift
//  HealthPartner
//
//  Created by Admin on 03/10/2016.
//  Copyright © 2016 Yuki. All rights reserved.
//

import UIKit

class TransferApprovalViewController: UIViewController, ZHDropDownMenuDelegate {

    @IBOutlet weak var menubutton: UIBarButtonItem!
    
    @IBOutlet weak var selectionMenu: ZHDropDownMenu!
    
    @IBOutlet weak var destinationMenu: ZHDropDownMenu!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if revealViewController() != nil {
            //            revealViewController().rearViewRevealWidth = 62
            menubutton.target = revealViewController()
            menubutton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        selectionMenu.options = ["Clinic Selection A","Clinic Selection B","Clinic Selection C","Clinic Selection  D","Clinic Selection E"]
        selectionMenu.editable = false
        
        destinationMenu.options = ["Clinic Destination A","Clinic Destination B","Clinic Destination C"]
        destinationMenu.editable = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // DropDownMenu Delegate
    func dropDownMenu(_ menu: ZHDropDownMenu!, didChoose index: Int) {
        print("\(menu) choosed at index \(index)")
    }
    
    func dropDownMenu(_ menu: ZHDropDownMenu!, didInput text: String!) {
        print("\(menu) input text \(text)")
    }
    
    
}
