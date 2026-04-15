//
//  DynamicContactsView.swift
//  Contacts
//
//  Created by Mohamed Morad on 15/04/26.
//

import SwiftUI

struct DynamicContactsView: View {
    
    let allContacts: [String] = ["Javier", "Maddie", "Bishal", "Morad", "lala", "Aka", "Shiro", "Mazitala", "Stamp"]
    
    // Group contacts by first letter
    var groupedContactsDictionary: [String: [String]] {
        Dictionary(grouping: allContacts) { contact in
            String(contact.prefix(1)).uppercased()
        }
    }
    
    // Section headers (A, B, C...)
    var sectionHeaders: [String] {
        groupedContactsDictionary.keys.sorted()
    }

    var body: some View {
        NavigationStack {
            List {
                ForEach(sectionHeaders, id: \.self) { header in
                    
                    Section(header: Text(header)) {
                        
                        if let contactsForSection = groupedContactsDictionary[header] {
                            ForEach(contactsForSection.sorted(), id: \.self) { contact in
                                HStack {
                                    Image(systemName: "person.fill")
                                        .foregroundColor(.blue)
                                    Text(contact)
                                }
                            }
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("All Contacts")
            .onAppear {
                printGroupedContacts()
            }
        }
    }
    
    func printGroupedContacts() {
        print("Raw Dictionary: \(groupedContactsDictionary)")
        
        print("\n--- Formatted Contacts ---")
        for key in groupedContactsDictionary.keys.sorted() {
            if let values = groupedContactsDictionary[key] {
                print("\(key): \(values)")
            }
        }
    }
}

#Preview {
    DynamicContactsView()
}
