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
    var gameTimer: Timer?
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    let FPS: Double = 6.0
    
    deinit {
        gameTimer?.invalidate()
    }
    
    init() {
        let snake: Snake = Snake(headPos: CGPoint(x: 4, y: 4), direction: .right, initialSize: 4)
        game = Game(areaSize: CGSize(width: 15, height: 15), snake: snake)
    }
    
    func startGame() {
        gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0/FPS, repeats: true, block: { [weak self] _ in
            self?.update()
        })
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
        
        if game.state == .crash {
            gameTimer?.invalidate()
        }
        objectWillChange.send()
    }
}
