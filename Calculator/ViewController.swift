//
//  ViewController.swift
//  Calculator
//
//  Created by Nguyen Duc Nguu on 20/04/2018.
//  Copyright © 2018 Nguyen Duc Nguu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var stringWithMathematicalOperation: String = ""
    var result: Double = 0
    var pheptoan = 1
    var phepdem = 0
    
    @IBOutlet weak var label: UILabel!

    @IBAction func button(_ sender: UIButton) {
        //=
        if sender.tag == 16 && phepdem == 0 && pheptoan == 1 && label.text != ""{
            let exp: NSExpression = NSExpression(format: stringWithMathematicalOperation)
            result = exp.expressionValue(with: nil, context: nil) as! Double
            label.text = String(result)
        }
        //C
        else if sender.tag == 11 {
            result = 0
            stringWithMathematicalOperation = ""
            label.text = String(result)
        }
    }
    
    @IBAction func number(_ sender: UIButton) {
        //0 -> 9
        if sender.tag < 12 {
            stringWithMathematicalOperation += String(sender.tag - 1)
            label.text = stringWithMathematicalOperation
            pheptoan = 1
        }
        //+
        else if label.text != "" && sender.tag == 15 && pheptoan == 1 {
            stringWithMathematicalOperation += "+"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
        }
        //-
        else if label.text != "" && sender.tag == 14 && pheptoan == 1 {
            stringWithMathematicalOperation += "-"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
        }
        //*
        else if label.text != "" && sender.tag == 13 && pheptoan == 1 {
            stringWithMathematicalOperation += "*"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
        }
        ///
        else if label.text != "" && sender.tag == 12 && pheptoan == 1 {
            stringWithMathematicalOperation += "/"
            label.text = stringWithMathematicalOperation
            pheptoan = 0
        }
        //.
        else if label.text != "" && sender.tag == 17 && pheptoan == 1 {
            stringWithMathematicalOperation += "."
            label.text = stringWithMathematicalOperation
            pheptoan = 0
        }
        //(
        else if label.text != "" && sender.tag == 18{
            stringWithMathematicalOperation += "("
            label.text = stringWithMathematicalOperation
            pheptoan = 0
            phepdem += 1
        }
        //)
        else if label.text != "" && sender.tag == 19{
            stringWithMathematicalOperation += ")"
            label.text = stringWithMathematicalOperation
            pheptoan = 1
            phepdem -= 1
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

