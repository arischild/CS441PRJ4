//
//  ViewController.swift
//  Connect4
//
//  Created by Ari Schild on 5/8/19.
//  Copyright © 2019 Ari Schild. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var a0: UILabel!
    @IBOutlet weak var b0: UILabel!
    @IBOutlet weak var c0: UILabel!
    @IBOutlet weak var d0: UILabel!
    @IBOutlet weak var e0: UILabel!
    @IBOutlet weak var f0: UILabel!
    @IBOutlet weak var g0: UILabel!
    @IBOutlet weak var a1: UILabel!
    @IBOutlet weak var b1: UILabel!
    @IBOutlet weak var c1: UILabel!
    @IBOutlet weak var d1: UILabel!
    @IBOutlet weak var e1: UILabel!
    @IBOutlet weak var f1: UILabel!
    @IBOutlet weak var g1: UILabel!
    @IBOutlet weak var a2: UILabel!
    @IBOutlet weak var b2: UILabel!
    @IBOutlet weak var c2: UILabel!
    @IBOutlet weak var d2: UILabel!
    @IBOutlet weak var e2: UILabel!
    @IBOutlet weak var f2: UILabel!
    @IBOutlet weak var g2: UILabel!
    @IBOutlet weak var a3: UILabel!
    @IBOutlet weak var b3: UILabel!
    @IBOutlet weak var c3: UILabel!
    @IBOutlet weak var d3: UILabel!
    @IBOutlet weak var e3: UILabel!
    @IBOutlet weak var f3: UILabel!
    @IBOutlet weak var g3: UILabel!
    @IBOutlet weak var a4: UILabel!
    @IBOutlet weak var b4: UILabel!
    @IBOutlet weak var c4: UILabel!
    @IBOutlet weak var d4: UILabel!
    @IBOutlet weak var e4: UILabel!
    @IBOutlet weak var f4: UILabel!
    @IBOutlet weak var g4: UILabel!
    @IBOutlet weak var a5: UILabel!
    @IBOutlet weak var b5: UILabel!
    @IBOutlet weak var c5: UILabel!
    @IBOutlet weak var d5: UILabel!
    @IBOutlet weak var e5: UILabel!
    @IBOutlet weak var f5: UILabel!
    @IBOutlet weak var g5: UILabel!
    @IBOutlet weak var a6: UILabel!
    @IBOutlet weak var b6: UILabel!
    @IBOutlet weak var c6: UILabel!
    @IBOutlet weak var d6: UILabel!
    @IBOutlet weak var e6: UILabel!
    @IBOutlet weak var f6: UILabel!
    @IBOutlet weak var g6: UILabel!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    var col0 = [UILabel]()
    var col1 = [UILabel]()
    var col2 = [UILabel]()
    var col3 = [UILabel]()
    var col4 = [UILabel]()
    var col5 = [UILabel]()
    var col6 = [UILabel]()
    
    var grid = [[UILabel]]()
    
    var toGo = "red"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        col0 = [a0, b0, c0, d0, e0, f0, g0]
        col1 = [a1, b1, c1, d1, e1, f1, g1]
        col2 = [a2, b2, c2, d2, e2, f2, g2]
        col3 = [a3, b3, c3, d3, e3, f3, g3]
        col4 = [a4, b4, c4, d4, e4, f4, g4]
        col5 = [a5, b5, c5, d5, e5, f5, g5]
        col6 = [a6, b6, c6, d6, e6, f6, g6]
        grid = [col0, col1, col2, col3, col4, col5, col6]
    }
    
    func dropToken(colNum: Int) {
        var col = grid[colNum]
        var i = 6
        while i >= 0 {
            if col[i].text == "X" {
                col[i].text = "0"
                if toGo == "red" {
                    col[i].textColor = UIColor.red
                    checkForWin(r: i, c: colNum)
                    toGo = "yellow"
                    turnLabel.text = "Yellow's Turn"
                    turnLabel.textColor = UIColor.yellow
                } else if toGo == "yellow" {
                    col[i].textColor = UIColor.yellow
                    checkForWin(r: i, c: colNum)
                    toGo = "red"
                    turnLabel.text = "Red's Turn"
                    turnLabel.textColor = UIColor.red
                }
                i = -1
            } else {
                i = i - 1
            }
        }
    }
    
    func checkForWin(r: Int, c: Int) {
        
    }

    @IBAction func col0Tapped(_ sender: Any) {
        dropToken(colNum: 0)
    }

    @IBAction func col1Tapped(_ sender: Any) {
        dropToken(colNum: 1)
    }
    
    @IBAction func col2Tapped(_ sender: Any) {
        dropToken(colNum: 2)
    }
    
    @IBAction func col3Tapped(_ sender: Any) {
        dropToken(colNum: 3)
    }
    
    @IBAction func col4Tapped(_ sender: Any) {
        dropToken(colNum: 4)
    }
    
    @IBAction func col6Tapped(_ sender: Any) {
        dropToken(colNum: 5)
    }
    
    @IBAction func col7Tapped(_ sender: Any) {
        dropToken(colNum: 6)
    }
}

