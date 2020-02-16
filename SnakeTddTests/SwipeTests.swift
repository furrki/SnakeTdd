//
//  SwipeTests.swift
//  SnakeTddTests
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import XCTest
import CoreGraphics
@testable import SnakeTdd

class SwipeTests: XCTestCase {
    func testDragSwipeHorizontal() {
        let gameView: GameView = GameView()
    
        XCTAssertNil(gameView.swiped(CGSize(width: 50.0, height: 0)))
        XCTAssertNil(gameView.swiped(CGSize(width: -50.0, height: 0)))
        
        XCTAssertNil(gameView.swiped(CGSize(width: 69.0, height: 0)))
        XCTAssertNil(gameView.swiped(CGSize(width: -69.0, height: 0)))
        
        XCTAssertNil(gameView.swiped(CGSize(width: 1.0, height: 0)))
        XCTAssertNil(gameView.swiped(CGSize(width: -1.0, height: 0)))
        
        XCTAssertNil(gameView.swiped(CGSize(width: 0, height: 0)))
        
        XCTAssertEqual(gameView.swiped(CGSize(width: 100, height: 0)), .right)
        XCTAssertEqual(gameView.swiped(CGSize(width: -100, height: 0)), .left)
        
        XCTAssertEqual(gameView.swiped(CGSize(width: 300, height: 0)), .right)
        XCTAssertEqual(gameView.swiped(CGSize(width: -300, height: 0)), .left)
    }
    
    func testDragSwipeVertical() {
        let gameView: GameView = GameView()
    
        XCTAssertNil(gameView.swiped(CGSize(width: 0.0, height: 50)))
        XCTAssertNil(gameView.swiped(CGSize(width: 0.0, height: -50)))
        
        XCTAssertNil(gameView.swiped(CGSize(width: 0.0, height: 69)))
        XCTAssertNil(gameView.swiped(CGSize(width: 0.0, height: -69)))
        
        XCTAssertNil(gameView.swiped(CGSize(width: 0, height: 1.0)))
        XCTAssertNil(gameView.swiped(CGSize(width: 0, height: -1.0)))
        
        XCTAssertNil(gameView.swiped(CGSize(width: 0, height: 0)))
        
        XCTAssertEqual(gameView.swiped(CGSize(width: 0, height: 100)), .down)
        XCTAssertEqual(gameView.swiped(CGSize(width: -0, height: -100)), .up)
        
        XCTAssertEqual(gameView.swiped(CGSize(width: 0, height: 300)), .down)
        XCTAssertEqual(gameView.swiped(CGSize(width: 0, height: -300)), .up)
    }
    
    func testCrossSwipe() {
        let gameView: GameView = GameView()
        
        XCTAssertNil(gameView.swiped(CGSize(width: 69.0, height: 69.0)))
        XCTAssertNil(gameView.swiped(CGSize(width: 1.0, height: -1.0)))
        
        XCTAssertEqual(gameView.swiped(CGSize(width: 70, height: -69.0)), .right)
        XCTAssertEqual(gameView.swiped(CGSize(width: 70, height: -71.0)), .up)
        
        XCTAssertEqual(gameView.swiped(CGSize(width: 140, height: -200.0)), .up)
        XCTAssertEqual(gameView.swiped(CGSize(width: 140, height: 200.0)), .down)
        XCTAssertEqual(gameView.swiped(CGSize(width: 140, height: 100.0)), .right)
        XCTAssertEqual(gameView.swiped(CGSize(width: -101, height: 100.0)), .left)
    }
}
