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
    
    var toGo = "Red"
    
    var newGame = false
    
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
    
    func restart() {
        var i = 0
        var j = 0
        while i <= 6 {
            j = 0
            while j <= 6 {
                grid[i][j].text = "X"
                grid[i][j].textColor = UIColor.black
                j += 1
            }
            i += 1
        }
        newGame = false
    }
    
    func dropToken(colNum: Int) {
        var col = grid[colNum]
        var i = 6
        while i >= 0 {
            if col[i].text == "X" {
                col[i].text = "0"
                if toGo == "Red" {
                    col[i].textColor = UIColor.red
                    if !checkForWin(r: i, c: colNum) {
                        toGo = "Yellow"
                        turnLabel.text = "Yellow's Turn"
                    } else {
                        i = -1
                        newGame = true
                    }
                } else if toGo == "Yellow" {
                    col[i].textColor = UIColor.yellow
                    if !checkForWin(r: i, c: colNum) {
                        toGo = "Red"
                        turnLabel.text = "Red's Turn"
                    } else {
                        i = -1
                        newGame = true
                    }
                }
                i = -1
            } else {
                i = i - 1
            }
        }
    }
    
    func checkForWin(r: Int, c: Int) -> Bool {
        if checkCol(r: r, c: c) { return true }
        if checkRow(r: r, c: c) { return true }
        if checkDiagonals(r: r, c: c) { return true }
        return false
    }
    
    func checkCol(r: Int, c: Int) -> Bool {
        var col = grid[c]
        var line = 1
        var rowNum = r + 1
        while rowNum <= 6 {
            if col[rowNum].textColor == UIColor.red {
                if toGo == "Red" {
                    line += 1
                } else {
                    rowNum = 7
                }
            } else if col[rowNum].textColor == UIColor.yellow {
                if toGo == "Yellow" {
                    line += 1
                } else {
                    rowNum = 7
                }
            }
            rowNum = rowNum + 1
        }
        if (line >= 4) {
            turnLabel.text = "\(toGo) wins!"
            return true
        }
        return false
    }
    
    
    func checkRow(r: Int, c: Int) -> Bool {
        var line = 1
        var colNum = c + 1
        while colNum <= 6  {
            if grid[colNum][r].text != "0" {
                colNum = 7
            } else if grid[colNum][r].textColor == UIColor.red {
                if toGo == "Red" {
                    line += 1
                } else {
                    colNum = 7
                }
            } else if grid[colNum][r].textColor == UIColor.yellow {
                if toGo == "Yellow" {
                    line += 1
                } else {
                    colNum = 7
                }
            }
            colNum += 1
        }
        colNum = c - 1
        while colNum >= 0  {
            if grid[colNum][r].text != "0" {
                colNum = -1
            } else if grid[colNum][r].textColor == UIColor.red {
                if toGo == "Red" {
                    line += 1
                } else {
                    colNum = -1
                }
            } else if grid[colNum][r].textColor == UIColor.yellow {
                if toGo == "Yellow" {
                    line += 1
                } else {
                    colNum = -1
                }
            }
            colNum -= 1
        }
        if (line >= 4) {
            turnLabel.text = "\(toGo) wins!"
            return true
        }
        return false
    }
    
    func checkDiagonals(r: Int, c: Int) -> Bool {
        var line = 1
        var colNum = c + 1
        var rowNum = r + 1
        while colNum <= 6 && rowNum <= 6 {
            if grid[colNum][rowNum].text != "0" {
                colNum = 7
            } else if grid[colNum][rowNum].textColor == UIColor.red {
                if toGo == "Red" {
                    line += 1
                } else {
                    colNum = 7
                }
            } else if grid[colNum][rowNum].textColor == UIColor.yellow {
                if toGo == "Yellow" {
                    line += 1
                } else {
                    colNum = 7
                }
            }
            colNum += 1
            rowNum += 1
        }
        colNum = c - 1
        rowNum = r - 1
        while colNum >= 0 && rowNum >= 0 {
            if grid[colNum][rowNum].text != "0" {
                colNum = -1
            } else if grid[colNum][rowNum].textColor == UIColor.red {
                if toGo == "Red" {
                    line += 1
                } else {
                    colNum = -1
                }
            } else if grid[colNum][rowNum].textColor == UIColor.yellow {
                if toGo == "Yellow" {
                    line += 1
                } else {
                    colNum = -1
                }
            }
            colNum -= 1
            rowNum -= 1
        }
        if (line >= 4) {
            turnLabel.text = "\(toGo) wins!"
            return true
        }
        line = 1
        colNum = c + 1
        rowNum = r - 1
        while colNum <= 6 && rowNum >= 0 {
            if grid[colNum][rowNum].text != "0" {
                colNum = 7
            } else if grid[colNum][rowNum].textColor == UIColor.red {
                if toGo == "Red" {
                    line += 1
                } else {
                    colNum = 7
                }
            } else if grid[colNum][rowNum].textColor == UIColor.yellow {
                if toGo == "Yellow" {
                    line += 1
                } else {
                    colNum = 7
                }
            }
            colNum += 1
            rowNum -= 1
        }
        colNum = c - 1
        rowNum = r + 1
        while colNum >= 0 && rowNum <= 6 {
            if grid[colNum][rowNum].text != "0" {
                colNum = -1
            } else if grid[colNum][rowNum].textColor == UIColor.red {
                if toGo == "Red" {
                    line += 1
                } else {
                    colNum = -1
                }
            } else if grid[colNum][rowNum].textColor == UIColor.yellow {
                if toGo == "Yellow" {
                    line += 1
                } else {
                    colNum = -1
                }
            }
            colNum -= 1
            rowNum += 1
        }
        if (line >= 4) {
            turnLabel.text = "\(toGo) wins!"
            return true
        }
        return false
    }

    @IBAction func col0Tapped(_ sender: Any) {
        if newGame { restart() }
        dropToken(colNum: 0)
    }

    @IBAction func col1Tapped(_ sender: Any) {
        if newGame { restart() }
        dropToken(colNum: 1)
    }
    
    @IBAction func col2Tapped(_ sender: Any) {
        if newGame { restart() }
        dropToken(colNum: 2)
    }
    
    @IBAction func col3Tapped(_ sender: Any) {
        if newGame { restart() }
        dropToken(colNum: 3)
    }
    
    @IBAction func col4Tapped(_ sender: Any) {
        if newGame { restart() }
        dropToken(colNum: 4)
    }
    
    @IBAction func col6Tapped(_ sender: Any) {
        if newGame { restart() }
        dropToken(colNum: 5)
    }
    
    @IBAction func col7Tapped(_ sender: Any) {
        if newGame { restart() }
        dropToken(colNum: 6)
    }
}

