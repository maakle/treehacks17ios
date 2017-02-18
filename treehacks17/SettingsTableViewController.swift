//
// SettingsTableViewController.swift
// Journeytags
//
// Created by Mathias Klenk on 03/02/16.
// Copyright © 2016 Stavros Filippidis. All rights reserved.
//
import UIKit
import Firebase

class SettingsTableViewController: UITableViewController {

    // MARK: Outlets
    @IBOutlet var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLogoStyles()
        
        //Change color of table to grey
        tblView.backgroundColor = UIColor(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0)
    }
    
    func setLogoStyles(){
        // Logo in NavBar
        let logo = UIImage(named: "nametag")
        let logoView = UIImageView(image: logo)
        logoView.frame.size.height = 42
        logoView.contentMode = .scaleAspectFit
        logoView.image = logo
        
        navigationItem.titleView = logoView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Section 1
        //Change App Permissions
        if indexPath.section == 1 {
            if indexPath.row == 0 {
                UIApplication.shared.openURL(URL(string:UIApplicationOpenSettingsURLString)!)
            }
        }
        
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                UIApplication.shared.openURL(URL(string:UIApplicationOpenSettingsURLString)!)
            }
        }

    }
}
