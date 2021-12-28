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
                    .swipeActions {
                        Button {
                            deletePlayer(id: player.id)
                        } label: {
                            Label("Delete", systemImage: "trash")
                        }
                    }
            }
        }
    }
    
    private func deletePlayer(id: String) {
        viewModel.deletePlayer(id: id)
    }
}

struct PlayerListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerListView()
    }
}
