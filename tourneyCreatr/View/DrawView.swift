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
        ScrollView {
            LazyVStack {
                ForEach(viewModel.matches, id: \.id) { match in
                    VStack {
                        MatchRowView(match: match)
                        if match.matchRecorded == true {
                            Text("RECORDED")
                        }
                    }
                }
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
