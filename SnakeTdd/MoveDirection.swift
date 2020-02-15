//
//  MoveDirection.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 15.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import UIKit

public enum MoveDirection {
    case left, right, up, down
}

public extension MoveDirection {
    func getVector() -> CGVector {
        switch self {
        case .left:
            return CGVector(dx: -1, dy: 0)
        case .right:
            return CGVector(dx: 1, dy: 0)
        case .up:
            return CGVector(dx: 0, dy: -1)
        case .down:
            return CGVector(dx: 0, dy: 1)
        }
    }
}
