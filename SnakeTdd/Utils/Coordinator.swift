//
//  Coordinator.swift
//  Sudokov
//
//  Created by furrki on 24.07.2022.
//

import Foundation

protocol Coordinator: ObservableObject {
    associatedtype Screen: RawRepresentable where Screen.RawValue: StringProtocol & Hashable, Screen: CaseIterable

    var currentScreen: Screen? { get set }
}

extension Coordinator {
    var screens: [Self.Screen] {
        Array(Self.Screen.allCases)
    }

    func popBack() {
        currentScreen = nil
    }
}
