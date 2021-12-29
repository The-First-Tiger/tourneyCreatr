//
//  ContentView.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 28.12.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                VStack {
                    AddPlayerView()
                    PlayerListView()
                }
                .navigationTitle("Spieler")
                .navigationBarTitleDisplayMode(.automatic)
            }
            .tabItem {
                Label("Spieler", systemImage: "person.3.sequence")
            }
            
            DrawView()
                .tabItem {
                    Label("Auslosung", systemImage: "list.triangle")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
