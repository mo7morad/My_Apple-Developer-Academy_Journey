//
//  ContentView.swift
//  Contact3
//

import SwiftUI

struct ContentView: View {
    
    @State private var contacts = mockContacts
    @State private var searchText = ""
    
    // MARK: - Filtered Contacts
    var filteredContacts: [Contact] {
        if searchText.isEmpty {
            return contacts
        } else {
            return contacts.filter {
                ($0.firstName + " " + $0.lastName)
                    .localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    // MARK: - Grouped
    var groupedContacts: [String: [Contact]] {
        Dictionary(grouping: filteredContacts) { $0.firstLetter }
    }
    
    var sectionTitles: [String] {
        groupedContacts.keys.sorted()
    }
    
    var body: some View {
        TabView {
            
            NavigationStack {
                ScrollViewReader { proxy in
                    
                    List {
                        ForEach(sectionTitles, id: \.self) { key in
                            Section(key) {
                                ForEach(groupedContacts[key] ?? []) { contact in
                                    ContactRow(contact: contact)
                                }
                            }
                            .id(key)
                        }
                    }
                    .listStyle(.plain)
                    
                    // MARK: Native-like Sidebar Index
                    .overlay(alignment: .trailing) {
                        VStack(spacing: 1) {
                            ForEach(sectionTitles, id: \.self) { letter in
                                Text(letter)
                                    .font(.caption2.bold())
                                    .foregroundStyle(.blue)
                                    .frame(width: 18, height: 14)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.2)) {
                                            proxy.scrollTo(letter, anchor: .top)
                                        }
                                    }
                            }
                        }
                        .padding(.vertical, 8)
                        .padding(.horizontal, 4)
                        .background(.ultraThinMaterial, in: Capsule())
                        .padding(.trailing, 2)
                    }
                    
                    .navigationTitle("Contacts")
                    .searchable(
                        text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Search"
                    )
                }
            }
            .tabItem {
                Label("Contacts", systemImage: "person.2.fill")
            }
            
            
            NavigationStack {
                VStack {
                    Text("Habits")
                        .font(.title)
                    
                    Text("Coming soon…")
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                }
                .padding()
                .navigationTitle("Habits")
            }
            .tabItem {
                Label("Habits", systemImage: "checkmark.circle")
            }
        }
    }
}

// MARK: - Contact Row
struct ContactRow: View {
    
    let contact: Contact
    
    var initials: String {
        let first = contact.firstName.prefix(1)
        let last = contact.lastName.prefix(1)
        return "\(first)\(last)"
    }
    
    var body: some View {
        HStack(spacing: 12) {
            
            Circle()
                .fill(.blue.opacity(0.15))
                .frame(width: 42, height: 42)
                .overlay {
                    Text(initials.uppercased())
                        .font(.subheadline.bold())
                        .foregroundStyle(.blue)
                }
            
            VStack(alignment: .leading, spacing: 2) {
                Text("\(contact.firstName) \(contact.lastName)")
                    .font(.body)
                
                Text("Mobile")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    ContentView()
}
