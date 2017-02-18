//
//  Rating3ViewController.swift
//  treehacks17
//
//  Created by Mathias Klenk on 18/02/17.
//  Copyright © 2017 Mathias Klenk. All rights reserved.
//

import UIKit

class Rating3ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    //Variables
    var ratingResult = 1
    var surveyDictionary = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        yesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        noButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func yesButtonTapped(_ sender: AnyObject) {
        yesButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        noButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        ratingResult = 1
    }
    
    @IBAction func noButtonTapped(_ sender: AnyObject) {
        noButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 26)
        yesButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        ratingResult = 0
    }
    
    @IBAction func continueButtonTapped(_ sender: AnyObject) {
        surveyDictionary["seeAgain"] = self.ratingResult
        print(surveyDictionary)
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let nextViewController = segue.destination as! Rating4ViewController
        nextViewController.surveyDictionary = self.surveyDictionary
    }
    

}
