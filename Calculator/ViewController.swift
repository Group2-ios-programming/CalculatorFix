import UIKit

class ViewController: UIViewController {

    var stringWithMathematicalOperation: String = ""
    var result: Double = 0
    var count = 0
    var temp = 0 //0 empty; 1 number; 2 operation; 3 .; 4 (; 5 )
    
    @IBOutlet weak var label: UILabel!

    @IBAction func button(_ sender: UIButton) {
        //=
        /*
         Dieu kien:
            + So luong ngoac mo == ngoac dong (count = 0)
            + Phan tu cuoi cung phai la so hoac ngoac dong (temp == 1 || temp == 5)
            + Chuoi phai khac rong (label.text != "")
        */
        if sender.tag == 16 && count == 0 && (temp == 1 || temp == 5) && label.text != ""{
            let exp: NSExpression = NSExpression(format: stringWithMathematicalOperation)
            result = exp.expressionValue(with: nil, context: nil) as! Double
            label.text = String(result)
        }
        //C
        else if sender.tag == 11 {
            temp = 0
            result = 0
            stringWithMathematicalOperation = ""
            label.text = String(result)
        }
        else if label.text != "" && sender.tag == 23 && count == 0
        {
            
            label.text = String((Double(stringWithMathematicalOperation)!)*(-1.0))
            temp = 2
        }
        
        
    }
    
    @IBAction func number(_ sender: UIButton) {
        //0 -> 9
        /*
         Dieu kien:
            + Phan tu cuoi cung phai khac ngoac dong (temp != 5)
         */
        if sender.tag < 12 && temp != 5{
            stringWithMathematicalOperation += String(sender.tag - 1)
            label.text = stringWithMathematicalOperation;
            temp = 1
        }
        // +/-
            /*
             Dieu kien:
             + Chuoi phai khac rong (label.text != "")
             + Phan tu cuoi cung phai khac operation (temp != 2)
             + Phan tu cuoi cung phai khac dau . (temp != 3)
             */
        else if label.text != "" && sender.tag == 23 && temp != 2 && temp != 3
        {
            label.text = String((Double(stringWithMathematicalOperation)!)/100)
            temp = 0
        }
        //tinh tan
        else if label.text != "" && sender.tag == 26 && temp != 2 && temp != 3
        {
            if ((Double(stringWithMathematicalOperation)!) == 90 )
            {
                label.text = "Error"
            }
                
            else
            {
                label.text = String(tan((Double.pi*(Double(stringWithMathematicalOperation)!))/180))
                temp = 0
            }
        }
            //tinh cos
        else if label.text != "" && sender.tag == 25 && temp != 2 && temp != 3
        {
            if ((Double(stringWithMathematicalOperation)!) == 90 )
            {
                label.text = String(0)
                temp = 0
                
            }
                
            else
            {
                label.text = String(cos((Double.pi*(Double(stringWithMathematicalOperation)!))/180))
                temp = 0
                
            }
        }
            
            //tinh sin
        else if label.text != "" && sender.tag == 24 && temp != 2 && temp != 3
        {
            
            label.text = String(sin((Double.pi*(Double(stringWithMathematicalOperation)!))/180))
            
            temp = 0
        }
            
            //tinh luy thua 2
        else if label.text != "" && sender.tag == 22 && temp != 2 && temp != 3
        {
            label.text = String(pow((Double(stringWithMathematicalOperation)!), 2.0))
            temp = 0
        }
            //ham log10
        else if label.text != "" && sender.tag == 21 && temp != 2 && temp != 3
        {
            label.text = String(log10(Double(stringWithMathematicalOperation)!))
            temp = 0
        }
            
            //can bac 2
        else if label.text != "" && sender.tag == 20 && temp != 2 && temp != 3
        {
            label.text = String(sqrt(Double(stringWithMathematicalOperation)!))
            temp = 0
        }
            
            //pi
        else if label.text != "" && sender.tag == 27 && temp != 2 && temp != 3
        {
            label.text = String(Double.pi)
            temp = 0
        }
        //+
        /*
        Dieu kien:
             + Chuoi phai khac rong (label.text != "")
             + Phan tu cuoi cung phai khac operation (temp != 2)
             + Phan tu cuoi cung phai khac dau . (temp != 3)
        */
        else if label.text != "" && sender.tag == 15 && temp != 2 && temp != 3 {
            stringWithMathematicalOperation += "+"
            label.text = stringWithMathematicalOperation
            temp = 2
        }
        //-
        /*
             Dieu kien tuong tu dau +
        */
        else if label.text != "" && sender.tag == 14 && temp != 2 && temp != 3 {
            stringWithMathematicalOperation += "-"
            label.text = stringWithMathematicalOperation
            temp = 2
        }
        //*
        /*
             Dieu kien tuong tu dau +
        */
        else if label.text != "" && sender.tag == 13 && temp != 2 && temp != 3 {
            stringWithMathematicalOperation += "*"
            label.text = stringWithMathematicalOperation
            temp = 2
        }
        ///
        /*
             Dieu kien tuong tu dau +
        */
        else if label.text != "" && sender.tag == 12 && temp != 2 && temp != 3 {
            stringWithMathematicalOperation += "/"
            label.text = stringWithMathematicalOperation
            temp = 2
        }
        //.
        /*
        Dieu kien:
             + Chuoi phai khac rong (label.text != "")
             + Phan tu cuoi cung phai la so (temp == 1)
        */
        else if label.text != "" && sender.tag == 17 && temp == 1 {
            stringWithMathematicalOperation += "."
            label.text = stringWithMathematicalOperation
            temp = 3
        }
        //(
        /*
        Dieu kien:
             + Phan tu cuoi cung phai la empty hoac operation hoac ( (temp == 0 || temp == 2 || temp == 4)
        */
        else if sender.tag == 18 && (temp == 0 || temp == 2 || temp == 4){
            stringWithMathematicalOperation += "("
            label.text = stringWithMathematicalOperation
            temp = 4
            count += 1
        }
        //)
        /*
        Dieu kien:
             + Chuoi phai khac rong (label.text != "")
             + Phan tu cuoi cung phai khac operation (temp != 2)
             + Phan tu cuoi cung phai khac dau . (temp != 3)
             + Phan tu cuoi cung phai khac dau ngoac mo (temp != 4)
             + So luong ngoac mo > so luong ngoac dong (count > 0)
        */
        else if label.text != "" && sender.tag == 19 && temp != 2 && temp != 3 && temp != 4 && count > 0{
            stringWithMathematicalOperation += ")"
            label.text = stringWithMathematicalOperation
            temp = 5
            count -= 1
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

