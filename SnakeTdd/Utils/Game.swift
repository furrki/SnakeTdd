//
//  Game.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 15.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import CoreGraphics

class Game {
    private(set) var areaSize: CGSize
    private(set) var score: Int = 0
    private(set) var snake: Snake
    private(set) var feedPosition: CGPoint
    private(set) var state: GameState = .running
    
    init(areaSize: CGSize, snake: Snake) {
        self.areaSize = areaSize
        self.snake = snake
        self.feedPosition = CGPoint(x: 0, y: 0)
        self.generateRandomFeed()
        state = .running
    }
    
    func generateFeed(_ pos: CGPoint) {
        self.feedPosition = pos
    }
    
    func generateRandomFeed() {
        var newPos: CGPoint = CGPoint(x: Int.random(in: 0..<Int(areaSize.width)), y: Int.random(in: 0..<Int(areaSize.height)))
        while snake.tail.contains(newPos) || snake.headPos == newPos {
            newPos = CGPoint(x: Int.random(in: 0..<Int(areaSize.width)), y: Int.random(in: 0..<Int(areaSize.height)))
        }
        generateFeed(newPos)
    }
    
    func doMovement() {
        snake.didMovement()
        if checkCollision() {
            state = .crash
        } else {
            if snake.headPos == feedPosition {
                state = .eat
            } else if state == .eat {
                state = .running
            }
        }
    }
    
    func checkCollision() -> Bool {
        return  (snake.headPos.x < 0 || snake.headPos.x >= areaSize.width) ||
                (snake.headPos.y < 0 || snake.headPos.y >= areaSize.height) ||
                snake.tail.contains(snake.headPos)
    }
}
