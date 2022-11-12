//
//  PhoneButtonsView.swift
//  SnakeTdd
//
//  Created by furrki on 12.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct PhoneButtonsView: View {
    // MARK: - Properties
    let tappedOnNumber: ((_ number: String) -> Void)?

    // MARK: - Body
    var body: some View {
        VStack(spacing: 20) {
            ForEach(0...2, id: \.self) { row in
                HStack(spacing: 20) {
                    ForEach(0...2, id: \.self) { col in
                        Button(action: {
                            tappedOnNumber?(getNumber(row: row, col: col))
                        }) {
                            Text(getNumber(row: row, col: col))
                                .frame(width: 75, height: 75)
                                .foregroundColor(Color(R.color.numberInputText.name))
                                .background(Color(R.color.numberInputBackground.name))
                                .clipShape(Circle())
                        }
                    }
                }
                .frame(maxWidth: .infinity)
            }
        }
        .frame(maxWidth: .infinity)

    }

    func getNumber(row: Int, col: Int) -> String {
        "\(row * 3 + col + 1)"
    }
}

struct PhoneButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        PhoneButtonsView { _ in

        }
    }
}
