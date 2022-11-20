//
//  StorageManager.swift
//  SnakeTdd
//
//  Created by furrki on 12.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import Foundation
import SwiftUI
import UIKit

class StorageManager {
    // MARK: - Constants
    private enum Keys {
        static let settings = "Settings"
        static let hasSetInputType = "HasSetInputType"
        static let highScore = "HighScore"
        static let biggestSnake = "BiggestSnake"
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

    var highScore: Int {
        get {
            fetchFromFile(key: Keys.highScore) ?? 0
        }

        set {
            try? storage.save(newValue, for: Keys.highScore)
        }
    }

    var biggestSnake: TableState? {
        get {
            fetchFromFile(key: Keys.biggestSnake)
        }

        set {
            try? storage.save(newValue, for: Keys.biggestSnake)
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

    private func getSavedImage(fileName: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(fileName).path)
        }

        return nil
    }

    @discardableResult
    private func saveImage(image: UIImage, fileName: String) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            try data.write(to: directory.appendingPathComponent("\(fileName).png")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
