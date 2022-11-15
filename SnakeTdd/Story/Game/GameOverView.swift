//
//  GameOverView.swift
//  SnakeTdd
//
//  Created by furrki on 12.11.2022.
//  Copyright © 2022 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Your snake is dead!")
                    .font(.headline)
            }
            .frame(height: 60)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(Color.black.opacity(0.8))
        }
        .frame(maxHeight: .infinity)
        .background(Color(R.color.gameOverBackgroundCover.name))
    }
}

struct GameOverView_Previews: PreviewProvider {
    static var previews: some View {
        GameOverView()
    }
}
