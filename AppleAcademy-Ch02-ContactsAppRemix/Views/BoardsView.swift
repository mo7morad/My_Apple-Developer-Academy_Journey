//
//  BoardsView.swift
//  Contacts
//

import SwiftUI

struct BoardsView: View {
    @EnvironmentObject private var store: HabitStore
    @Binding var selectedTab: AppTab

    var body: some View {
        NavigationStack {
            Group {
                if store.habits.isEmpty {
                    // ── Empty state ──
                    VStack(spacing: 12) {
                        Image(systemName: "person.2")
                            .font(.system(size: 44))
                            .foregroundStyle(.secondary)
                        Text("No habits yet")
                            .font(.headline)
                        Text("Tap a contact to start a shared habit.")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    List {
                        ForEach(store.habits) { habit in
                            HabitCardView(habit: habit)
                                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                                .listRowSeparator(.hidden)
                                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                                    Button(role: .destructive) {
                                        store.deleteHabit(habitId: habit.id)
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .background(Color(UIColor.systemBackground))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        selectedTab = .contacts
                    } label: {
                        Image(systemName: "plus")
                            .font(.system(size: 20, weight: .regular))
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
    }
}

#Preview {
    BoardsView(selectedTab: .constant(.boards))
        .environmentObject(HabitStore())
}
