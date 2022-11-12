//
//  DependencyManager.swift
//  SnakeTdd
//
//  Created by furrki on 12.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import Foundation

enum DependencyManager {
    private static let path = URL(fileURLWithPath: NSTemporaryDirectory())
    private static let disk = DiskStorage(path: path)

    static let storage = CodableStorage(storage: disk)
    static let storageManager = StorageManager(storage: storage)
}
