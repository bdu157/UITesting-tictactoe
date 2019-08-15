//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//
//  Created by Dongwoo Pae on 8/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest


class TicTacToeUITests: XCTestCase {
    
    //Helper Properties
    private enum Mark: Equatable {
        case x
        case o
        case empty
        
        var stringValue: String {
            switch self {
                case .x: return "X"
                case .o: return "O"
                case .empty: return " "
            }
        }
    }
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var restartButton: XCUIElement {
        return app.buttons["GameViewController.RestartButton"]
    }
    private var turnLabel: XCUIElement {
        return app.staticTexts["GameViewController.TurnLabel"]
    }
    
    
    //we need this for UI Testing
    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    
    
    // Helper Method
    
    private func buttonFor(_ index: Int) -> XCUIElement {
        return app.buttons["Button\(index)"]
    }

    func testWinCheckingVertical1() {
        /*
         0 1 2
         3 4 5
         6 7 8
        */
        
        /*
         x o -
         x o -
         x - -
        */
        //using accessibility - identifier and 
        let button0 = buttonFor(0)
        let button1 = buttonFor(1)
        let button3 = buttonFor(3)
        let button4 = buttonFor(4)
        let button6 = buttonFor(6)
        
        button0.tap()
        XCTAssertEqual(button0.label, Mark.x.stringValue)    //button0.label should be Mark.x.stringValue
        XCTAssertEqual(turnLabel.label, "Player O's turn")  //turnLabel.label should be Player O's turn
        
        button1.tap()
        XCTAssertEqual(button1.label, Mark.o.stringValue)    //button0.label should be Mark.o.stringValue
        XCTAssertEqual(turnLabel.label, "Player X's turn")  //turnLabel.label should be Player X's turn
        
        button3.tap()
        XCTAssertEqual(button3.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        button4.tap()
        XCTAssertEqual(button4.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        
        button6.tap()
        XCTAssertEqual(button6.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player X won!")
    }
    
    func testRestartingGame() {
        //Tap a square so the board is not empty
        let button4 = buttonFor(4)
        button4.tap()
        //Make sure a mark has been replaced on the board
        XCTAssertEqual(button4.label, Mark.x.stringValue)
        
        //check for the next player's turn
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        restartButton.tap()
        
        for i in 0...8 {
            XCTAssertEqual(buttonFor(i).label, Mark.empty.stringValue)
        }
    }
    
    
    
    func testWinCheckingDiagonal() {
        /*
         0 1 2
         3 4 5
         6 7 8
         */
        
        /*
         x o -
         o x -
         - - x
         */
        let button0 = buttonFor(0)
        let button1 = buttonFor(1)
        let button4 = buttonFor(4)
        let button3 = buttonFor(3)
        let button8 = buttonFor(8)
        
        button0.tap()
        XCTAssertEqual(button0.label, Mark.x.stringValue)    //button0.label should be Mark.x.stringValue
        XCTAssertEqual(turnLabel.label, "Player O's turn")  //turnLabel.label should be Player O's turn
        
        button1.tap()
        XCTAssertEqual(button1.label, Mark.o.stringValue)    //button0.label should be Mark.o.stringValue
        XCTAssertEqual(turnLabel.label, "Player X's turn")  //turnLabel.label should be Player X's turn
        
        button4.tap()
        XCTAssertEqual(button4.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        button3.tap()
        XCTAssertEqual(button3.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        
        button8.tap()
        XCTAssertEqual(button8.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player X won!")
    }
    
    
    
    func testCatsGame() {
        /*
         0 1 2
         3 4 5
         6 7 8
         */
        
        /*
         x o o
         o x x
         x x o
         */
        let button0 = buttonFor(0)
        let button1 = buttonFor(1)
        let button2 = buttonFor(2)
        let button3 = buttonFor(3)
        let button4 = buttonFor(4)
        let button5 = buttonFor(5)
        let button6 = buttonFor(6)
        let button7 = buttonFor(7)
        let button8 = buttonFor(8)
        
        
        button0.tap()
        XCTAssertEqual(button0.label, Mark.x.stringValue)    //button0.label should be Mark.x.stringValue
        XCTAssertEqual(turnLabel.label, "Player O's turn")  //turnLabel.label should be Player O's turn
        
        button1.tap()
        XCTAssertEqual(button1.label, Mark.o.stringValue)    //button0.label should be Mark.o.stringValue
        XCTAssertEqual(turnLabel.label, "Player X's turn")  //turnLabel.label should be Player X's turn
        
        button4.tap()
        XCTAssertEqual(button4.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        button2.tap()
        XCTAssertEqual(button2.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        
        button5.tap()
        XCTAssertEqual(button5.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        button3.tap()
        XCTAssertEqual(button3.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        
        button6.tap()
        XCTAssertEqual(button6.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Player O's turn")
        
        button8.tap()
        XCTAssertEqual(button8.label, Mark.o.stringValue)
        XCTAssertEqual(turnLabel.label, "Player X's turn")
        
        button7.tap()
        XCTAssertEqual(button7.label, Mark.x.stringValue)
        XCTAssertEqual(turnLabel.label, "Cat's game!")
    }
    
}
