//
//  GameSituationTests.swift
//  SnakeTddTests
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import XCTest
@testable import SnakeTdd

class GameSituationTests: XCTestCase {
    func testEating() {
        let snake: Snake = Snake(headPos: CGPoint(x: 15, y: 15), direction: .right, initialSize: 4)
        let game: Game = Game(areaSize: CGSize(width: 150, height: 150), snake: snake)
        
        game.generateFeed(CGPoint(x: 16, y: 15))
        game.doMovement()
        XCTAssertEqual(game.state, .eat)
        XCTAssertEqual(game.snake.tail, [
            CGPoint(x: 12, y: 15),
            CGPoint(x: 13, y: 15),
            CGPoint(x: 14, y: 15),
            CGPoint(x: 15, y: 15),
        ])

    }
    
    func testComplexEating() {
        let snake: Snake = Snake(headPos: CGPoint(x: 15, y: 15), direction: .right, initialSize: 4)
        let game: Game = Game(areaSize: CGSize(width: 150, height: 150), snake: snake)
        
        game.generateFeed(CGPoint(x: 16, y: 15))
        
        game.doMovement()
        XCTAssertEqual(game.snake.tail, [
            CGPoint(x: 12, y: 15),
            CGPoint(x: 13, y: 15),
            CGPoint(x: 14, y: 15),
            CGPoint(x: 15, y: 15),
        ])
        XCTAssertEqual(game.snake.headPos, CGPoint(x: 16, y: 15))
        
        game.snake.setDirection(.down)
        game.doMovement()
        game.doMovement()
        
        XCTAssertEqual(game.snake.tail, [
            CGPoint(x: 14, y: 15),
            CGPoint(x: 15, y: 15),
            CGPoint(x: 16, y: 15),
            CGPoint(x: 16, y: 16),
        ])
    }
    
    func testCollisionWithWall() {
        let snake: Snake = Snake(headPos: CGPoint(x: 0, y: 0), direction: .up, initialSize: 5)
        let game: Game = Game(areaSize: CGSize(width: 150, height: 150), snake: snake)
        
        game.doMovement()
        XCTAssertEqual(game.state, .crash)
    }
    
    func testSelfCollision() {
        let snake: Snake = Snake(headPos: CGPoint(x: 30, y: 30), direction: .right, initialSize: 20)
        let game: Game = Game(areaSize: CGSize(width: 150, height: 150), snake: snake)
        
        game.doMovement()
        game.doMovement()
        game.snake.setDirection(.down)
        game.doMovement()
        game.doMovement()
        game.snake.setDirection(.left)
        game.doMovement()
        game.doMovement()
        game.snake.setDirection(.up)
        game.doMovement()
        game.doMovement()
        game.doMovement()
        XCTAssertEqual(game.state, .crash)
    }
}
