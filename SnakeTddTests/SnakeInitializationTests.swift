//
//  SnakeInitializationTests.swift
//  SnakeInitializationTests
//
//  Created by Furkan Kaynar on 15.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import XCTest
@testable import SnakeTdd

class SnakeInitializationTests: XCTestCase {
    func testInitGame() {
        let game: Game = Game(areaSize: CGSize(width: 100, height: 100), snake: Snake(headPos: CGPoint(x: 15, y: 15), direction: .right, initialSize: 5))
        
        XCTAssertEqual(game.areaSize.width, 100)
        XCTAssertEqual(game.areaSize.height, 100)
        XCTAssertEqual(game.score, 0)
        XCTAssertNotNil(game.state)
        XCTAssertNotNil(game.snake)
    }
    
    func testInitSnake() {
        let snake: Snake = Snake(headPos: CGPoint(x: 10, y: 10), direction: .down, initialSize: 4)
        
        XCTAssertEqual(snake.headPos.x, 10)
        XCTAssertEqual(snake.headPos.y, 10)
        XCTAssertEqual(snake.direction, .down)
        XCTAssertEqual(snake.tail.count, 3)
    }
    
    func testInitTail() {
        let snakeDown: Snake = Snake(headPos: CGPoint(x: 10, y: 10), direction: .down, initialSize: 4)
        XCTAssertEqual(snakeDown.tail, [CGPoint(x: 10, y: 13), CGPoint(x: 10, y: 12), CGPoint(x: 10, y: 11)])
        
        let snakeUp: Snake = Snake(headPos: CGPoint(x: 10, y: 10), direction: .up, initialSize: 4)
        XCTAssertEqual(snakeUp.tail, [CGPoint(x: 10, y: 7), CGPoint(x: 10, y: 8), CGPoint(x: 10, y: 9)])
        
        let snakeLeft: Snake = Snake(headPos: CGPoint(x: 10, y: 10), direction: .left, initialSize: 4)
        XCTAssertEqual(snakeLeft.tail, [CGPoint(x: 7, y: 10), CGPoint(x: 8, y: 10), CGPoint(x: 9, y: 10)])
        
        let snakeRight: Snake = Snake(headPos: CGPoint(x: 10, y: 10), direction: .right, initialSize: 4)
        XCTAssertEqual(snakeRight.tail, [CGPoint(x: 13, y: 10), CGPoint(x: 12, y: 10), CGPoint(x: 11, y: 10)])
    }
    
    func testMoveDirectionVectors() {
        let direction: MoveDirection = .up
        let position: CGPoint = CGPoint(x: 50, y: 50)
        XCTAssertEqual(position + direction.getVector(), CGPoint(x: 50, y: 49))
    }
}
