//
//  GameViewModel.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import Foundation
import CoreGraphics
import Combine

class GameViewModel {
    var game: Game
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    init() {
        let snake: Snake = Snake(headPos: CGPoint(x: 20, y: 20), direction: .right, initialSize: 4)
        game = Game(areaSize: CGSize(width: 30, height: 30), snake: snake)
    }
    
    func swipe(_ direction: MoveDirection) {
        game.snake.setDirection(direction)
    }
    
    func getCellType(_ i: Int, _ j: Int) -> CellType {
        if game.snake.tail.contains(CGPoint(x: i, y: j)) || game.snake.headPos == CGPoint(x: i, y: j) {
            return .snake
        } else if game.feedPosition == CGPoint(x: i, y: j) {
            return .feed
        } else {
            return .empty
        }
    }
    
    func update() {
        game.doMovement()
        objectWillChange.send()
    }
}
