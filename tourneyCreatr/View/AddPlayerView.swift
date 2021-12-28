//
//  AddPlayerView.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 28.12.21.
//

import SwiftUI

struct AddPlayerView: View {
    
    @State private var vorname: String = ""
    @State private var nachname: String = ""
    
    @EnvironmentObject private var viewModel: PlayerViewModel
    
    var body: some View {
        HStack(spacing: 10) {
            TextField("Vorname", text: $vorname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Nachname", text: $nachname)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: handleSubmit) {
                Image(systemName: "plus")
            }
        }
        .padding(20)
    }
    
    private func handleSubmit() {
        viewModel.addPlayer(vorname: vorname, nachname: nachname)
        vorname = ""
        nachname = ""
    }
}

struct AddPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        AddPlayerView()
    }
}
