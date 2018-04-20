//
//  ViewController.swift
//  Calculator
//
//  Created by Nguyen Duc Nguu on 20/04/2018.
//  Copyright © 2018 Nguyen Duc Nguu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0;
    var previousNumber:Double = 0;
    var performingMatch = false;
    var operation = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMatch == true {
            label.text = String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
            performingMatch = false
        }
        else {
            label.text = label.text! + String(sender.tag - 1)
            numberOnScreen = Double(label.text!)!
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if(label.text != "" && sender.tag != 11 && sender.tag != 16){
            previousNumber = Double(label.text!)!
            if sender.tag == 12 { //Chia
                label.text = "/";
            }
            else if sender.tag == 13 { //Nhan
                label.text = "x";
            }
            else if sender.tag == 14 { //Tru
                label.text = "-";
            }
            else if sender.tag == 15 { //Cong
                label.text = "+";
            }
            
            operation = sender.tag
            performingMatch = true;
        }
        else if sender.tag == 16 { //=
            if operation == 12 {
                label.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13 {
                label.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14 {
                label.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15 {
                label.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11 {
            label.text = ""
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

