//
//  ViewController.swift
//  BullsEye
//
//  Created by Vikas Hanumegowda on 6/18/17.
//  Copyright © 2017 Vikas Hanumegowda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 50
    
    var targetValue: Int = 0

    @IBOutlet weak var slider : UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentValue = lroundf(slider.value)
        startNewRound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is: \(currentValue)" +
                      "\nThe target value is: \(targetValue)"
        let alert = UIAlertController(title: "Hello, world", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil )
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
    }

}

