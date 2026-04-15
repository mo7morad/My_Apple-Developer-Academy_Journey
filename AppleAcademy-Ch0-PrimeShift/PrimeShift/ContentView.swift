//
//  ContentView.swift
//  PrimeShift
//
//  Created by Mohamed Morad on 11/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack{
            List{
                
                HStack{
                    
                    Image("biker")
                        .resizable()
                        .frame(width: 100, height: 100)

                        .scaledToFit()
                    Text("An OG Biker")
                    
                    
                }

            }
            .navigationTitle(Text("Academy Eats"))
        }
        }
    
    
}

#Preview {
    ContentView()
}

