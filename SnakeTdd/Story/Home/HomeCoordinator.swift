//
//  HomeCoordinator.swift
//  SnakeTdd
//
//  Created by furrki on 8.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import Foundation
import Combine

class HomeCoordinator: Coordinator, ObservableObject {
    @Published var currentScreen: Screen?

    enum Screen: String, Hashable, CaseIterable {
        case game
    }
}
