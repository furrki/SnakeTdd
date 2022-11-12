//
//  Storage.swift
//  Sudokov
//
//  Created by furrki on 25.07.2022.
//  From: https://swiftwithmajid.com/2019/05/22/storing-codable-structs-on-the-disk/
//

import Foundation

typealias Handler<T> = (Result<T, Error>) -> Void

protocol ReadableStorage {
    func fetchValue(for key: String) throws -> Data
    func fetchValue(for key: String, handler: @escaping Handler<Data>)
}

protocol WritableStorage {
    func save(value: Data, for key: String) throws
    func save(value: Data, for key: String, handler: @escaping Handler<Data>)
}

typealias Storage = ReadableStorage & WritableStorage
