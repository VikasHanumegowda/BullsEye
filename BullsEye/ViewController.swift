//
//  ViewController.swift
//  BullsEye
//
//  Created by Vikas Hanumegowda on 6/18/17.
//  Copyright © 2017 Vikas Hanumegowda. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showAlert() {
        
        let alert = UIAlertController(title: "Hello, world", message: "This is my first app!", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil )
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }

}

