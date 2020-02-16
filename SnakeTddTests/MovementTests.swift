//
//  MovementTests.swift
//  MovementTests
//
//  Created by Furkan Kaynar on 15.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import XCTest
@testable import SnakeTdd

class MovementTests: XCTestCase {
    func makeGame() -> Game {
        let snake: Snake = Snake(headPos: CGPoint(x: 15, y: 15), direction: .right, initialSize: 4)
        let game: Game = Game(areaSize: CGSize(width: 150, height: 150), snake: snake)
        return game
    }
    
    func testMovement() {
        let game: Game = makeGame()
        
        game.doMovement()
        XCTAssertEqual(game.snake.headPos, CGPoint(x: 16, y: 15))
        
        for _ in 1...5 {
            game.doMovement()
        }
        XCTAssertEqual(game.snake.headPos, CGPoint(x: 21, y: 15))
        
        game.snake.setDirection(.up)
        game.doMovement()
        
        XCTAssertEqual(game.snake.headPos, CGPoint(x: 21, y: 14))
        
        for _ in 1...5 {
            game.doMovement()
        }
        
        XCTAssertEqual(game.snake.headPos, CGPoint(x: 21, y: 9))
        
    }
    
    func testComplexMoving() {
        let game: Game = makeGame()
        
        game.generateFeed(CGPoint(x: 100, y: 100))
        game.doMovement()
        XCTAssertEqual(game.snake.tail, [
            CGPoint(x: 13, y: 15),
            CGPoint(x: 14, y: 15),
            CGPoint(x: 15, y: 15),
        ])
        game.snake.setDirection(.down)
        game.doMovement()
        game.doMovement()
        XCTAssertEqual(game.snake.tail, [
            CGPoint(x: 15, y: 15),
            CGPoint(x: 16, y: 15),
            CGPoint(x: 16, y: 16),
        ])
        XCTAssertEqual(game.snake.headPos, CGPoint(x: 16, y: 17))
        game.doMovement()
        XCTAssertEqual(game.snake.headPos, CGPoint(x: 16, y: 18))
        XCTAssertEqual(game.snake.tail, [
            CGPoint(x: 16, y: 15),
            CGPoint(x: 16, y: 16),
            CGPoint(x: 16, y: 17),
        ])
        
    }
    
    func testSetDirection() {
        let game: Game = makeGame()
        
        game.snake.setDirection(.left)
        XCTAssertEqual(game.snake.direction, .right)
        
        game.snake.setDirection(.up)
        XCTAssertEqual(game.snake.direction, .up)
        
        game.doMovement()
        
        game.snake.setDirection(.left)
        XCTAssertEqual(game.snake.direction, .left)
        
    }
    
    func testLastDirection() {
        let game: Game = makeGame()
        
        game.doMovement()
        XCTAssertEqual(game.snake.lastDirection, .right)
        
        game.snake.setDirection(.up)
        game.doMovement()
        XCTAssertEqual(game.snake.lastDirection, .up)
        
        game.snake.setDirection(.left)
        game.snake.setDirection(.down)
        game.doMovement()
        XCTAssertEqual(game.snake.lastDirection, .left)
    }
    
}
