//
//  PlayersView.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 28.12.21.
//

import SwiftUI

struct PlayerRowView: View {
    
    let player: Player
    
    var body: some View {
        Text(player.vorname + " " + player.nachname)
            .padding(EdgeInsets(top: 16, leading: 20, bottom: 16, trailing: 20))
    }
}

struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerRowView(player: mockPlayer)
    }
}
