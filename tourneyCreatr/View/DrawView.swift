//
//  DrawView.swift
//  tourneyCreatr
//
//  Created by Maximilian Enders on 29.12.21.
//

import SwiftUI

struct DrawView: View {
    
    @EnvironmentObject private var viewModel: PlayerViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.matches, id: \.id) { match in
                MatchRowView(match: match)
            }
        }
        .onAppear {
            viewModel.makeDraw()
        }
    }
}

struct DrawView_Previews: PreviewProvider {
    static var previews: some View {
        DrawView()
            .environmentObject(PlayerViewModel())
    }
}
