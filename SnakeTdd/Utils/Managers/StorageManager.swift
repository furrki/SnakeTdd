//
//  StorageManager.swift
//  SnakeTdd
//
//  Created by furrki on 12.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import Foundation
import SwiftUI

class StorageManager {
    // MARK: - Constants
    private enum Keys {
        static let settings = "Settings"
        static let hasSetInputType = "HasSetInputType"
    }

    // MARK: - Properties
    private let storage: CodableStorage

    // MARK: - Methods
    init(storage: CodableStorage = DependencyManager.storage) {
        self.storage = storage
    }

    // MARK: - Computed Properties
    var settingsManager: SettingsManager {
        get {
            fetchFromFile(key: Keys.settings) ?? SettingsManager(isUsingSwipe: true)
        }

        set {
            try? storage.save(newValue, for: Keys.settings)
        }
    }

    var hasSetInputType: Bool {
        get {
            fetchFromFile(key: Keys.hasSetInputType) ?? false
        }

        set {
            try? storage.save(newValue, for: Keys.hasSetInputType)
        }
    }

    private func fetchFromFile<D: Decodable>(key: String) -> D? {
        do {
            let data: D = try storage.fetch(for: key)
            return data
        } catch {
            return nil
        }
    }
}
