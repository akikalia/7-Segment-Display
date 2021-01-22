//
//  ViewController.swift
//  7 Segment Display
//
//  Created by Alexsandre kikalia on 11/8/20.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var digitView1, digitView2, digitView3: UIView!
    
    func setDigitSegments(digitView: inout UIView, arr: [Bool]){
        for i in 0...6 {
            digitView.subviews[i].backgroundColor = arr[i] ? .red : UIColor.init(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        }

    }
    func createSegmentArr( T: Bool = true, LT: Bool = true, RT: Bool = true, M: Bool = true, LB: Bool = true, RB: Bool = true, B: Bool = true) -> [Bool]{
        return [T, LT, RT, M, LB, RB, B]
    }

    func displayDigit(digitView: inout UIView, digit: Int){
        switch digit{
        case 0:
            setDigitSegments(digitView: &digitView, arr: createSegmentArr(M: false))
        case 1:
            setDigitSegments(digitView: &digitView, arr: createSegmentArr(T: false, LT: false, M: false, LB: false, B: false))
        case 2:
            setDigitSegments(digitView: &digitView, arr: createSegmentArr(LT: false, RB: false))
        case 3:
            setDigitSegments(digitView: &digitView, arr: createSegmentArr(LT: false, LB: false))
        case 4:
            setDigitSegments(digitView: &digitView, arr: createSegmentArr(T: false, LB: false, B: false))
        case 5:
            setDigitSegments(digitView: &digitView, arr: createSegmentArr(RT: false, LB: false))
        case 6:
            setDigitSegments(digitView: &digitView, arr: createSegmentArr(RT: false))
        case 7:
            setDigitSegments(digitView: &digitView, arr: createSegmentArr(LT: false, M: false, LB: false, B: false))
        case 8:
            setDigitSegments(digitView: &digitView, arr: createSegmentArr())
        case 9:
            setDigitSegments(digitView: &digitView, arr: createSegmentArr(LB: false))
        default:
            setDigitSegments(digitView: &digitView, arr: createSegmentArr())
        }
    }

    func displayNumber(num: Int){
        var num = num
        displayDigit(digitView: &digitView3, digit: num%10)
        num /= 10
        displayDigit(digitView: &digitView2, digit: num%10)
        num /= 10
        displayDigit(digitView: &digitView1, digit: num%10)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let numToDisplay = 789
        displayNumber(num: numToDisplay)
    }


}

