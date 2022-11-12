//
//  SettingsManager.swift
//  SnakeTdd
//
//  Created by furrki on 12.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import Combine
import Foundation

class SettingsManager: ObservableObject, Codable {
    var isUsingButtons: Bool {
        didSet {
            DependencyManager.storageManager.settingsManager = self
        }
    }

    init(isUsingSwipe: Bool) {
        self.isUsingButtons = isUsingSwipe
    }
}
