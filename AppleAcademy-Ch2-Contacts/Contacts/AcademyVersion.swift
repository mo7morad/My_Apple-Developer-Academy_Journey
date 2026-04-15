//
//  StaticContactsView.swift
//  Contacts
//
//  Created by Javier Fransiscus on 15/04/26.
//

import SwiftUI

struct StaticContactsView: View {
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 60, height: 60)
                            .foregroundColor(.gray)
                        Text("CL")
                    }
                    VStack(alignment: .leading) {
                        Text("Charles Leclerc")
                        Text("My Card")
                    }
                    .padding(5)
                }
                
                Section(header: Text("C")) {
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                            Text("CL")
                        }
                        Text("Charles Leclerc")
                    }
                }
                .sectionIndexLabel("C")
                
                Section(header: Text("G")) {
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.gray)
                            Text("GR")
                        }
                        Text("George Russell")
                    }
                }
                .sectionIndexLabel("G")
            }
            .listSectionIndexVisibility(.visible)
            .listStyle(.plain)
            .navigationTitle("Contacts")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: .constant(""))
            .toolbar {
                DefaultToolbarItem(kind: .search, placement: .bottomBar)
                ToolbarSpacer(.flexible, placement: .bottomBar)
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        print("test")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    StaticContactsView()
}
