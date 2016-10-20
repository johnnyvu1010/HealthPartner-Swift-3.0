//
//  HomeViewController.swift
//  HealthPartner
//
//  Created by Admin on 07/10/2016.
//  Copyright © 2016 Yuki. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var statusImg: UIImageView!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    
    
    @IBOutlet weak var tmpDesLbl: UILabel!
    
    
    
    @IBOutlet weak var menubutton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if revealViewController() != nil {
            //            revealViewController().rearViewRevealWidth = 62
            menubutton.target = revealViewController()
            menubutton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
        statusImg.image = UIImage(named : "icon_noconnection.png")
        statusLbl.text = "NO CONNECTION!"
        nameLbl.text = "CA"
//        statusLbl.textColor = UIColor.red
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func test_clicked(_ sender: AnyObject) {
        
    }

}
