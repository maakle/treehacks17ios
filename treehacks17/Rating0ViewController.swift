//
//  Rating0ViewController.swift
//  treehacks17
//
//  Created by Mathias Klenk on 18/02/17.
//  Copyright © 2017 Mathias Klenk. All rights reserved.
//

import UIKit

class Rating0ViewController: UIViewController {

    @IBOutlet weak var feedbackTextview: UITextView!
    
    //Variables
    var surveyDictionary = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func continueButtonTapped(_ sender: AnyObject) {
    
        surveyDictionary["writtenFeedback"] = feedbackTextview.text
        print(surveyDictionary)
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextViewController = segue.destination as! Rating1ViewController
        nextViewController.surveyDictionary = self.surveyDictionary
    }
}
