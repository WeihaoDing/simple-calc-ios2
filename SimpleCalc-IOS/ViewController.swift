//
//  ViewController.swift
//  SimpleCalc-IOS
//
//  Created by gmhding on 2017/10/25.
//  Copyright © 2017年 gmhding. All rights reserved.
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextScene = segue.destination as! HistoryViewController
        nextScene.history = history
    }

    @IBOutlet weak var display: UITextField!
    
    var nums: [Int] = []
    var firstNum: Int = 0
    var secondNum: Int = 0
    var operators = ""
    var result: Int = 0
    var index = 1
    var currentNum: Int = 0
    var history = [String]()
    
    
    
    
    @IBAction func pressClear(_ sender: UIButton) {
        operators = "C"
        nums.removeAll()
        firstNum = 0
        secondNum = 0
        operators = ""
        result = 0
        display.text! = ""
        currentNum = 0
        index = 1
    }
    
    func checkIfFirstNum(num: Int) {
        if operators == "" {
            firstNum = num
            nums.append(num)
        } else if operators == "avg" || operators == "count" {
            nums.append(num)
        } else if operators == "fact"{
            return
        } else {
            secondNum = num
        }
    }
    
    @IBAction func numZero(_ sender: UIButton) {
        display.text = "0"
        currentNum = 0
        checkIfFirstNum(num: 0)
    }
    
    @IBAction func numOne(_ sender: UIButton) {
        display.text = "1"
        currentNum = 1
        checkIfFirstNum(num: 1)
    }
    
    
    @IBAction func numTwo(_ sender: UIButton) {
        display.text = "2"
        currentNum = 2
        checkIfFirstNum(num: 2)
    }
    
    @IBAction func numThree(_ sender: UIButton) {
        display.text = "3"
        currentNum = 3
        checkIfFirstNum(num: 3)
    }
    
    @IBAction func numFour(_ sender: UIButton) {
        display.text = "4"
        currentNum = 4
        checkIfFirstNum(num: 4)
    }
    
    
    @IBAction func numFive(_ sender: UIButton) {
        display.text = "5"
        currentNum = 5
        checkIfFirstNum(num: 5)
    }
    
    
    @IBAction func numSix(_ sender: UIButton) {
        display.text = "6"
        currentNum = 6
        checkIfFirstNum(num: 6)
    }
    
    
    @IBAction func numSeven(_ sender: UIButton) {
        display.text = "7"
        currentNum = 7
        checkIfFirstNum(num: 7)
    }
    
    @IBAction func numEight(_ sender: UIButton) {
        display.text = "8"
        currentNum = 8
        checkIfFirstNum(num: 8)
    }
    
    
    @IBAction func numNine(_ sender: UIButton) {
        display.text = "9"
        currentNum = 9
        checkIfFirstNum(num: 9)
    }
    
    
    @IBAction func pressTimes(_ sender: UIButton) {
        operators = "*"
    }
    
    @IBAction func pressMinus(_ sender: UIButton) {
        operators = "-"
    }
    
    
    @IBAction func pressPlus(_ sender: UIButton) {
        operators = "+"
    }
    
    
    @IBAction func pressMod(_ sender: UIButton) {
        operators = "%"
    }
    
    
    @IBAction func pressCount(_ sender: UIButton) {
        operators = "count"
        index += 1
    }
    
    
    @IBAction func pressAvg(_ sender: UIButton) {
        operators = "avg"
    }
    
    @IBAction func pressFact(_ sender: UIButton) {
        operators = "fact"
        result = factCalc(num: firstNum)
        history.append("\(firstNum) \(operators) = \(result)")
        display.text! = String(result)
        nums.removeAll()
        firstNum = 0
        secondNum = 0
        operators = ""
        result = 0
        currentNum = 0
        index = 1
    }
    
    
    @IBAction func pressEqual(_ sender: UIButton)  {
        if operators == "" {
            return
        } else {
            switch operators {
            case "+":
                result = firstNum + secondNum
            case "-":
                result = firstNum - secondNum
            case "*":
                result = firstNum * secondNum
            case "/":
                result = firstNum / secondNum
            case "%":
                result = firstNum % secondNum
            case "count":
                result = Int(index)
            case "avg":
                var sum = 0
                for i in 0 ... (nums.count - 1) {
                    sum += nums[i]
                }
                result = sum / nums.count
            default:
                break
            }
        }
        if operators == "count" || operators == "avg" {
            var dummyString = ""
            for i in 0...nums.count - 2{
                dummyString += String(nums[i])
                dummyString += " \(operators) "
            }
            dummyString += String(currentNum)
            dummyString += " "
            history.append("\(dummyString)  = \(result)")
        } else {
            history.append("\(firstNum) \(operators) \(secondNum) = \(result)")
        }
        display.text! = String(result)
        nums.removeAll()
        firstNum = 0
        secondNum = 0
        operators = ""
        result = 0
        currentNum = 0
        index = 1
    }
    
    func factCalc(num: Int) -> Int {
        if num == 0 {
            return 1
        } else {
            return num * factCalc(num: num - 1)
        }
    }

}



