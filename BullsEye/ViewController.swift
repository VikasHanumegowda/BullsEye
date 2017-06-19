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
    var points: Int = 0
    var targetValue: Int = 0
    var roundNo: Int = 0

    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var labelpoints: UILabel!
    @IBOutlet weak var roundNumber: UILabel!
    
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
        let difference = abs(targetValue - currentValue)
        let score = 100 - difference
        let title: String
        
        points+=score
        if score==100 {
            title = "Perfect!"
        } else if score > 95 {
            title = "You almost had it!"
        } else if score > 90 {
            title = "Pretty good!"
        } else {
            title = "You're not even trying :("
        }
        let message = "You scored \(score) points\nYour value: \(currentValue)"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: { action in
                                                self.startNewRound()
                                            })
                    alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func restartGame(_ button: UIButton){
        roundNo = 0
        points = 0
        startNewRound()
    }
    
    func startNewRound() {
        roundNo+=1
        targetValue = 1 + Int(arc4random_uniform(100))
        updateLabels()
        currentValue = 50
        slider.value = Float(currentValue)
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        labelpoints.text = String(points)
        roundNumber.text = "\(roundNo)"
    }

}

