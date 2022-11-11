//
//  BackButton.swift
//  Sudokov
//
//  Created by furrki on 17.10.2022.
//

import SwiftUI

struct BackButton: View {
    let onTapBack: (() -> Void)
    
    var body: some View {
        Button {
            onTapBack()
        } label: {
            Image(systemName: "xmark.circle")
                .resizable()
                .foregroundColor(Color(R.color.commonButtonText.name))
                .frame(width: 25, height: 25)
        }
    }
}
