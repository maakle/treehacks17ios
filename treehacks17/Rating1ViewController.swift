//
//  Rating1ViewController.swift
//  treehacks17
//
//  Created by Mathias Klenk on 18/02/17.
//  Copyright © 2017 Mathias Klenk. All rights reserved.
//

import UIKit

class Rating1ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderResultLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    //Variables
    var ratingResult = 2
    var surveyDictionary = [String: Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func sliderAction(_ sender: AnyObject) {
        
        if (slider.value < 0.5){
            ratingResult = 0
            sliderResultLabel.text = "Not good"
        } else if (slider.value > 0.5 && slider.value < 1.5){
            ratingResult = 1
            sliderResultLabel.text = "Less good"
        } else if (slider.value > 1.5 && slider.value < 2.5) {
            ratingResult = 2
            sliderResultLabel.text = "Neutral"
        } else if (slider.value > 2.5 && slider.value < 3.5){
            ratingResult = 3
            sliderResultLabel.text = "Quite good"
        } else {
            ratingResult = 4
            sliderResultLabel.text = "Excellent"
        }
    }

    @IBAction func continueButtonTapped(_ sender: AnyObject) {
        
        surveyDictionary["rating"] = self.ratingResult
        print(surveyDictionary)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let nextViewController = segue.destination as! Rating2ViewController
        nextViewController.surveyDictionary = self.surveyDictionary
    }

}
