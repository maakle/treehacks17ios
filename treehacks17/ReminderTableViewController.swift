//
//  ReminderTableViewController.swift
//  treehacks17
//
//  Created by Mathias Klenk on 17/02/17.
//  Copyright © 2017 Mathias Klenk. All rights reserved.
//

import UIKit
import Firebase

class ReminderTableViewController: UITableViewController {
    
    //Variables
    var arrayWithAllReminders = [String: AnyObject]()
    var arrayWithKeys = [String]()

    //Structure
    let structure = FirebaseStruct()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLogoStyles()
        loadDataFromDatabase()
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

    func loadDataFromDatabase(){
        
        arrayWithAllReminders.removeAll()
        
        let refForReminder = self.structure.ref.child("reminders/testPatient")
        refForReminder.observeSingleEvent(of: .value, with: { snapshot in
        
            if snapshot.exists() || snapshot.value != nil {
            
                self.arrayWithAllReminders = snapshot.value as! [String : AnyObject]
                
                for (key, _) in self.arrayWithAllReminders {
                    self.arrayWithKeys.append(key)
                }
                
                self.tableView.reloadData()
            }
        })
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayWithAllReminders.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell", for: indexPath) as! ReminderTableViewCell
        
        //Fill label in cell
        let key = arrayWithKeys[indexPath.row]
        let reminder = arrayWithAllReminders[key]!
        cell.notificationTitle.text = reminder["message"] as? String
        cell.timeLabel.text = reminder["timestamp"] as? String
        
        if (reminder["category"] as? Int == 0) {
            cell.notificationMarker.backgroundColor = UIColor.purple
        } else if (reminder["category"] as? Int == 2) {
            cell.notificationMarker.backgroundColor = UIColor.orange
        } else {
            //default
        }
        
        //Style of the notificationmarker
        cell.notificationMarker.layer.masksToBounds = true;
        cell.notificationMarker.layer.cornerRadius = 8
        cell.notificationMarker.clipsToBounds = true
        cell.notificationMarker.isHidden = false

        return cell
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
