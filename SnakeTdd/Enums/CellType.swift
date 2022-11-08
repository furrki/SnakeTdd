//
//  CellType.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

public enum CellType {
    case snake, feed, empty, snakeHead
}

public extension CellType {
    func getColor() -> Color {
        switch self {
        case .snake:
            return Color(R.color.gameSnakeBody.name)
        case .snakeHead:
            return Color(R.color.gameSnakeHead.name)
        case .feed:
            return Color(R.color.gameFeed.name)
        case .empty:
            return Color(R.color.gameBoard.name)
        }
    }
}
