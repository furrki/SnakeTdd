//
//  SelectInputView.swift
//  SnakeTdd
//
//  Created by furrki on 17.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct SelectInputView: View {
    enum InputSelection: Int {
        case buttons
        case swipe
    }

    @State private var selection: InputSelection = .buttons
    let onConfirm: ((_ selection: InputSelection) -> Void)?

    var body: some View {
        VStack {
            Text("How do you prefer to play?")
                .font(.title2)
                .foregroundColor(Color(R.color.commonTitle.name))
                .padding(.bottom, 20)

            HStack(spacing: 10) {
                optionView(imageName: R.image.settingsGameButtons.name,
                           description: "Classical",
                           option: .buttons)

                optionView(imageName: R.image.settingsGameSwipe.name,
                           description: "Swipe",
                           option: .swipe)
            }

            Button("Confirm") {
                onConfirm?(selection)
            }
            .buttonStyle(MenuButton())
            .font(.system(size: 15, weight: .semibold))
            .padding(.top, 30)
        }
    }

    private func optionView(imageName: String,
                            description: String,
                            option: InputSelection) -> some View {
        VStack {
            Text(description)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(Color(R.color.commonTitle.name))
                .padding(.top, 10)

            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
                .cornerRadius(5.0)
                .opacity(selection == option ? 1 : 0.8)

        }
        .background(Color(R.color.commonSelectionBorder.name).opacity(selection == option ? 1 : 0.5))
        .border(Color(R.color.commonSelectionBorder.name).opacity(selection == option ? 1 : 0.5), width: 3.0)
        .cornerRadius(5.0)
        .onTapGesture {
            withAnimation {
                self.selection = option
            }
        }
    }
}

struct SelectInputView_Previews: PreviewProvider {
    static var previews: some View {
        SelectInputView(onConfirm: nil)
    }
}
