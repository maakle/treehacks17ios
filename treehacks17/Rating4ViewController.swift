//
//  Rating4ViewController.swift
//  treehacks17
//
//  Created by Mathias Klenk on 18/02/17.
//  Copyright © 2017 Mathias Klenk. All rights reserved.
//

import UIKit
import Firebase

class Rating4ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    //Variables
    var ratingResult = 1
    var surveyDictionary = [String: Any]()
    
    //Structure
    var structure = FirebaseStruct()
    
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
        surveyDictionary["recommendation"] = self.ratingResult
        print(surveyDictionary)
        
        let reference = structure.ref.child("docSurveys/IDdrSanchez")
        let surveyRef = reference.childByAutoId()
        surveyRef.setValue(surveyDictionary)
        
        backFour()
    }
    
    func backFour() {
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController];
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 6], animated: true);
        
    }
}
