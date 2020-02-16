//
//  CellType.swift
//  SnakeTdd
//
//  Created by Furkan Kaynar on 16.02.2020.
//  Copyright © 2020 Furkan Kaynar. All rights reserved.
//

import SwiftUI

public enum CellType {
    case snake, feed, empty
}

public extension CellType {
    func getColor() -> Color {
        switch self {
        case .snake:
            return Color.red
        case .feed:
            return Color.green
        case .empty:
            return Color.yellow
        }
    }
}
