//
//  HomeView.swift
//  Distill
//
//  Created by Mohamed Morad on 03/07/2026.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        
        NavigationStack{
            
            VStack {
                
                // MARK: - Header
                
                Button("Start Painting") {
                    
                }
                .frame(width: 250)
                .foregroundStyle(.white)
                .padding(20)
                .background(
                    Capsule()
                        .fill(.black)
                )
                .clipShape(.capsule)
                .font(Font.title3.bold())
                
                Spacer()
                
                // MARK: - Start Painting Button
                
                
                
                Divider()
                
                
                
                // MARK: - Painting Grid
                
                
                
            }
            .navigationTitle(Text("Distill"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Select") {
                        
                    }
                }

                ToolbarSpacer(.fixed, placement: .topBarTrailing)

                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "translate")
                    }

                    Button {
                        
                    } label: {
                        Image(systemName: "info")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

