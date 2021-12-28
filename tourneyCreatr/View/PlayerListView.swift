//
//  PlayerListView.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 28.12.21.
//

import SwiftUI

struct PlayerListView: View {
    
    @EnvironmentObject private var viewModel: PlayerViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.players, id: \.id) { player in
                PlayerRowView(player: player)
            }
        }
    }
}

struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
    }
}
