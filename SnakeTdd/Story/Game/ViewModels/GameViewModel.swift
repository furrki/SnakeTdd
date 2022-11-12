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

class GameViewModel: ObservableObject {
    @Published var game: Game

    let objectWillChange = PassthroughSubject<Void, Never>()

    init() {
        let snake: Snake = Snake(headPos: CGPoint(x: 4, y: 4), direction: .right, initialSize: 4)
        game = Game(areaSize: CGSize(width: 18.0, height: 18.0), snake: snake)
    }
    
    func swipe(_ direction: MoveDirection) {
        game.snake.setDirection(direction)
    }
    
    func getCellType(_ i: Int, _ j: Int) -> CellType {
        if game.snake.tail.contains(CGPoint(x: i, y: j)) {
            return .snake
        } else if game.snake.headPos == CGPoint(x: i, y: j) {
            return .snakeHead
        } else if game.feedPosition == CGPoint(x: i, y: j) {
            return .feed
        } else {
            return .empty
        }
    }

    func swipeByButton(number: String) {
        switch number {
        case "1":
            swipe(game.snake.direction.getClockwisePrevious())
        case "2":
            swipe(.up)
        case "3":
            swipe(game.snake.direction.getClockwiseNext())
        case "4":
            swipe(.left)
        case "6":
            swipe(.right)
        case "8":
            swipe(.down)
        default:
            break
        }
    }
    
    func update() {
        game.doMovement()
        objectWillChange.send()
    }
}
