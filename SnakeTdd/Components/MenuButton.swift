//
//  MenuButton.swift
//  SnakeTdd
//
//  Created by furrki on 10.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct MenuButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.horizontal, 40)
            .padding(.vertical, 15)
            .background(Color(R.color.commonButtonBackground.name))
            .foregroundColor(Color(R.color.commonButtonText.name))
            .clipShape(Capsule())
    }
}

struct MenuButton_Previews: PreviewProvider {
    static var previews: some View {
        Button("Press Me") {
            print("Button pressed!")
        }
        .buttonStyle(MenuButton())
    }
}
