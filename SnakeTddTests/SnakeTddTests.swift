//
//  SnakeTddTests.swift
//  SnakeTddTests
//
//  Created by Furkan Kaynar on 15.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import XCTest
@testable import SnakeTdd

class SnakeInitializationTests: XCTestCase {
    func testInitGame() {
        let game: Game = Game(speed: 2, areaSize: CGSize(width: 100, height: 100))
        
        XCTAssertEqual(game.areaSize.width, 100)
        XCTAssertEqual(game.areaSize.height, 100)
        XCTAssertEqual(game.speed, 2)
    }
    
    func testInitSnake() {
        let snake: Snake = Snake(headPos: CGPoint(x: 10, y: 10), direction: .down, initialSize: 4)
        
        XCTAssertEqual(snake.headPos.x, 10)
        XCTAssertEqual(snake.headPos.y, 10)
        XCTAssertEqual(snake.direction, .down)
        XCTAssertEqual(snake.tail.count, 3)
        XCTAssertEqual(snake.tail, [CGPoint(x: 10, y: 9), CGPoint(x: 10, y: 8), CGPoint(x: 10, y: 7)])
    }
}
