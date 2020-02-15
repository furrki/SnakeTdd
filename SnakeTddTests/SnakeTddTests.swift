//
//  SnakeTddTests.swift
//  SnakeTddTests
//
//  Created by Furkan Kaynar on 15.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import XCTest
@testable import SnakeTdd

class SnakeGameTddTests: XCTestCase {
    func testInitGame() {
        let game: Game = Game(speed: 2, areaSize: CGSize(width: 100, height: 100))
        
        XCTAssertEqual(game.areaSize.width, 100)
        XCTAssertEqual(game.areaSize.height, 100)
        XCTAssertEqual(game.speed, 2)
    }
}
