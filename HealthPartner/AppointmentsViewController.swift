//
//  AppointmentsViewController.swift
//  HealthPartner
//
//  Created by Admin on 03/10/2016.
//  Copyright © 2016 Yuki. All rights reserved.
//

import UIKit

class AppointmentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var menubutton: UIBarButtonItem!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    let m_data = ["SEP", "SEP", "SEP", "SEP", "SEP", "SEP"]
    let d_data = ["12", "20", "26", "27", "28", "30"]
    let t_data = ["11:00 AM", "9:00 AM", "10:00AM","11:00 AM", "9:00 AM", "10:00AM"]
    let n_data = ["Ganga S Reddy", "Males Yahn", "Hopseon Den","Ganga S Reddy", "Males Yahn", "Hopseon Den"]
    let i_data = ["Office Visit", "Office Visit", "Office Visit","Office Visit", "Office Visit", "Office Visit"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if revealViewController() != nil {
            //            revealViewController().rearViewRevealWidth = 62
            menubutton.target = revealViewController()
            menubutton.action = #selector(SWRevealViewController.revealToggle(_:))
            
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // TableView Delegate & Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return m_data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppointmentTableViewCell", for: indexPath) as! AppointmentTableViewCell
        
        cell.m_label.text = m_data[indexPath.row]
        cell.d_label.text = d_data[indexPath.row]
        cell.t_label.text = t_data[indexPath.row]
        cell.n_label.text = n_data[indexPath.row]
        cell.i_label.text = i_data[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
