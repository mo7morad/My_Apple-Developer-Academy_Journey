//
//  HabitModel.swift
//  Contacts
//

import SwiftUI

struct HabitBoard: Identifiable {
    let id: UUID
    var name: String
    var icon: String
    var reminderTime: Date?
    var createdAt: Date

    // Binary history: 0 = not done, 1 = done.
    // Index 0 = oldest day, last index = today (140 days total).
    var myHistory: [Int]

    // Accountability partner + their simulated history.
    var partner: Contact?
    var partnerHistory: [Int]

    init(
        id: UUID = UUID(),
        name: String,
        icon: String = "⭐️",
        reminderTime: Date? = nil,
        createdAt: Date? = nil,
        myHistory: [Int] = [0],
        partner: Contact? = nil,
        partnerHistory: [Int] = []
    ) {
        let calendar = Calendar.current
        let normalizedCreatedAt = calendar.startOfDay(
            for: createdAt
                ?? calendar.date(byAdding: .day, value: -(myHistory.count - 1), to: Date())
                ?? Date()
        )

        self.id = id
        self.name = name
        self.icon = icon
        self.reminderTime = reminderTime
        self.createdAt = normalizedCreatedAt
        self.myHistory = myHistory
        self.partner = partner
        self.partnerHistory = partnerHistory.isEmpty
            ? Array(repeating: 0, count: myHistory.count)
            : partnerHistory
    }

    var todayCheckedIn: Bool { myHistory.last == 1 }
}

// Kept only as a fallback so previews compile when the store is empty.
let mockHabits: [HabitBoard] = []
