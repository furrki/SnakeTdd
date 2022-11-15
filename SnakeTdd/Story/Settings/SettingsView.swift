//
//  SettingsView.swift
//  SnakeTdd
//
//  Created by furrki on 12.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import Combine
import SwiftUI

struct SettingsView: View {
    private let storageManager = DependencyManager.storageManager
    @ObservedObject var settingsManager = DependencyManager.storageManager.settingsManager

    var body: some View {
        NavigationView {
            List {
                Section {
                    Toggle(isOn: $settingsManager.isUsingButtons) {
                        Text("Show input buttons")
                    }
                }
            }
            .navigationTitle("Settings")
        }
        .onDisappear {

        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
