//
//  ViewController.swift
//  iOS-TTT
//
//  Created by John Colley on 7/10/17.
//  Copyright © 2017 John Colley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    var lastWinner = "None"
    var turn = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setButtonBorder()
        if lastWinner == "None" || lastWinner == "Blue" {
            winnerLabel.text = "Red Goes First"
            turn = "Red"
        } else if lastWinner == "red" {
            winnerLabel.text = "Blue Goes First"
            turn = "Blue"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tttButtonPressed(_ sender: UIButton) {
        if lastWinner == "None" {
            if sender.backgroundColor === nil {
                sender.backgroundColor = whosTurn(turn: turn)
                lastWinner = checkWinner()
                if lastWinner == "None"{
                    turn = nextPlayersTurn(turn: turn)
                }
            }
        } else {
            winnerLabel.text = "Tap Reset to Play Again"
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: UIButton) {
        resetGame()
    }
    
    func whosTurn(turn: String) -> UIColor {
        if turn == "Red" {
            return UIColor.red
        } else {
            return UIColor.blue
        }
    }
    
    func nextPlayersTurn(turn: String) -> String {
        if turn == "Red" {
            winnerLabel.text = "Blue's Turn"
            return "Blue"
        } else {
            winnerLabel.text = "Red's Turn"
            return "Red"
        }
    }
    
    func checkWinner() -> String {
        var winner = "None"

        // [X][X][X]
        // [ ][ ][ ]
        // [ ][ ][ ]
        if (btn1.backgroundColor != nil && btn2.backgroundColor != nil && btn3.backgroundColor != nil) && btn1.backgroundColor == btn2.backgroundColor && btn2.backgroundColor == btn3.backgroundColor {
            winner = turn
            
        // [X][ ][ ]
        // [ ][X][ ]
        // [ ][ ][X]
        } else if (btn1.backgroundColor != nil && btn5.backgroundColor != nil && btn9.backgroundColor != nil) && btn1.backgroundColor == btn5.backgroundColor && btn5.backgroundColor == btn9.backgroundColor {
            winner = turn
            
        // [X][ ][ ]
        // [X][ ][ ]
        // [X][ ][ ]
        } else if (btn1.backgroundColor != nil && btn4.backgroundColor != nil && btn7.backgroundColor != nil) && btn1.backgroundColor == btn4.backgroundColor && btn4.backgroundColor == btn7.backgroundColor {
            winner = turn
            
        // [ ][X][ ]
        // [ ][X][ ]
        // [ ][X][ ]
        } else if (btn2.backgroundColor != nil && btn5.backgroundColor != nil && btn8.backgroundColor != nil) && btn2.backgroundColor == btn5.backgroundColor && btn5.backgroundColor == btn8.backgroundColor {
            winner = turn
            
        // [ ][ ][X]
        // [ ][X][ ]
        // [X][ ][ ]
        } else if (btn3.backgroundColor != nil && btn5.backgroundColor != nil && btn7.backgroundColor != nil) && btn3.backgroundColor == btn5.backgroundColor && btn5.backgroundColor == btn7.backgroundColor {
            winner = turn
            
        // [ ][ ][X]
        // [ ][ ][X]
        // [ ][ ][X]
        } else if (btn3.backgroundColor != nil && btn6.backgroundColor != nil && btn9.backgroundColor != nil) && btn3.backgroundColor == btn6.backgroundColor && btn6.backgroundColor == btn9.backgroundColor {
            winner = turn
            
        // [ ][ ][ ]
        // [X][X][X]
        // [ ][ ][ ]
        } else if (btn4.backgroundColor != nil && btn5.backgroundColor != nil && btn6.backgroundColor != nil) && btn4.backgroundColor == btn5.backgroundColor && btn5.backgroundColor == btn6.backgroundColor {
            winner = turn
        
        // [ ][ ][ ]
        // [ ][ ][ ]
        // [X][X][X]
        } else if (btn7.backgroundColor != nil && btn8.backgroundColor != nil && btn9.backgroundColor != nil) && btn7.backgroundColor == btn8.backgroundColor && btn8.backgroundColor == btn9.backgroundColor {
            winner = turn
        } else if btn1.backgroundColor != nil && btn2.backgroundColor != nil && btn3.backgroundColor != nil && btn4.backgroundColor != nil && btn5.backgroundColor != nil && btn6.backgroundColor != nil && btn7.backgroundColor != nil && btn8.backgroundColor != nil && btn9.backgroundColor != nil {
            winner = "draw"
        } else {
            winner = "None"
        }

        if winner == "draw" {
            endGame()
            turn = nextPlayersTurn(turn: turn)
            winnerLabel.text = "Draw! \(turn) goes first this time!"
        } else if winner != "None" {
            endGame()
            winnerLabel.text = "\(turn) won and gets to go first!"
        }
        return winner
    }
    
    func endGame(){
        
    }
    
    func setButtonBorder(){
        btn1.layer.borderWidth = 1
        btn1.layer.cornerRadius = 10
        btn1.layer.borderColor = UIColor.black.cgColor
        btn2.layer.borderWidth = 1
        btn2.layer.cornerRadius = 10
        btn2.layer.borderColor = UIColor.black.cgColor
        btn3.layer.borderWidth = 1
        btn3.layer.cornerRadius = 10
        btn3.layer.borderColor = UIColor.black.cgColor
        btn4.layer.borderWidth = 1
        btn4.layer.cornerRadius = 10
        btn4.layer.borderColor = UIColor.black.cgColor
        btn5.layer.borderWidth = 1
        btn5.layer.cornerRadius = 10
        btn5.layer.borderColor = UIColor.black.cgColor
        btn6.layer.borderWidth = 1
        btn6.layer.cornerRadius = 10
        btn6.layer.borderColor = UIColor.black.cgColor
        btn7.layer.borderWidth = 1
        btn7.layer.cornerRadius = 10
        btn7.layer.borderColor = UIColor.black.cgColor
        btn8.layer.borderWidth = 1
        btn8.layer.cornerRadius = 10
        btn8.layer.borderColor = UIColor.black.cgColor
        btn9.layer.borderWidth = 1
        btn9.layer.cornerRadius = 10
        btn9.layer.borderColor = UIColor.black.cgColor
    }
    
    func resetGame(){
        winnerLabel.text = "\(turn)'s turn"
        lastWinner = "None"
        btn1.backgroundColor = nil
        btn2.backgroundColor = nil
        btn3.backgroundColor = nil
        btn4.backgroundColor = nil
        btn5.backgroundColor = nil
        btn6.backgroundColor = nil
        btn7.backgroundColor = nil
        btn8.backgroundColor = nil
        btn9.backgroundColor = nil
    }
}

