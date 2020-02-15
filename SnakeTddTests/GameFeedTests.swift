//
//  GameFeedTests.swift
//  GameFeedTests
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import XCTest
@testable import SnakeTdd

class GameFeedTests: XCTestCase {

    func testFeedGeneration() {
        let snake: Snake = Snake(headPos: CGPoint(x: 15, y: 15), direction: .right, initialSize: 5)
        let game: Game = Game(areaSize: CGSize(width: 150, height: 150), snake: snake)
        game.generateFeed(CGPoint(x: 50, y: 50))
       
        XCTAssertEqual(game.feedPosition.x, 50)
        XCTAssertEqual(game.feedPosition.y, 50)
    }
    
    func testRandomFeedGeneration() {
        let snake: Snake = Snake(headPos: CGPoint(x: 15, y: 15), direction: .right, initialSize: 5)
        let game: Game = Game(areaSize: CGSize(width: 150, height: 150), snake: snake)
        
        game.generateRandomFeed()
        XCTAssertFalse(game.snake.tail.contains(game.feedPosition))
        XCTAssertNotEqual(game.feedPosition, game.snake.headPos)
        XCTAssertTrue(game.feedPosition.x < 150 && game.feedPosition.x >= 0)
        XCTAssertTrue(game.feedPosition.y < 150 && game.feedPosition.y >= 0)
    }
}
