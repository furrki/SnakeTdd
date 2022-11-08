//
//  Snake.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 15.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import CoreGraphics

class Snake {
    private(set) var headPos: CGPoint
    private(set) var direction: MoveDirection
    private(set) var lastDirection: MoveDirection
    private(set) var tail: [CGPoint] = []
    
    var futureHeadPos: CGPoint {
        return self.headPos + self.direction.getVector()
    }
    
    var futureTail: [CGPoint] {
        var nextTail: [CGPoint] = self.tail
        for (i, _) in self.tail.enumerated() {
            if i != self.tail.count - 1 {
                nextTail[i] = self.tail[i + 1]
            } else {
                nextTail[i] = self.headPos
            }
        }
        return nextTail
    }
    
    init(headPos: CGPoint, direction: MoveDirection, initialSize: Int) {
        self.headPos = headPos
        self.direction = direction
        self.lastDirection = direction
        initTail(initialSize: initialSize)
    }
    
     func initTail(initialSize: Int) {
        for i in (1...(initialSize-1)) {
            self.tail.insert(headPos - direction.getVector() * CGFloat(i), at: 0)
        }
    }
    
    func setDirection(_ newDirection: MoveDirection) {
        if newDirection.getVector() + lastDirection.getVector() != CGVector(dx: 0, dy: 0) {
            direction = newDirection
        }
    }
    
    func didMovement(isEating: Bool = false) {
        if isEating {
            self.tail.append(self.headPos)
        } else {
            self.tail = self.futureTail
        }
        self.headPos = self.headPos + self.direction.getVector()
        self.lastDirection = self.direction
    }
}
