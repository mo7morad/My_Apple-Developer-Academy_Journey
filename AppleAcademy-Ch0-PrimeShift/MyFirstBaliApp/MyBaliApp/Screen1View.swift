//
//  Screen1View.swift
//  MyFirstBaliApp
//
//  Created by Ivan on 03/03/26.
//  Refactored by Morad developer for PrimeShift App
//

import SwiftUI

// My own color pallete that I will be using
let bgDark = Color(red: 16/255, green: 22/255, blue: 34/255) // #101622
let cardDark = Color(red: 15/255, green: 23/255, blue: 42/255) // #0F172A
let borderDark = Color(red: 30/255, green: 41/255, blue: 59/255) // #1E293B
let primaryBlue = Color(red: 17/255, green: 82/255, blue: 212/255) // #1152d4

// This is my Reusable Maintenance Card.
struct MaintenanceCard: View {
    let iconName: String
    let title: String
    let interval: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Upper Part
            HStack {
                // Icon
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(primaryBlue.opacity(0.15))
                        .frame(width: 40, height: 40)
                    Image(systemName: iconName)
                        .font(.headline)
                        .foregroundColor(primaryBlue)
                }
                
                Text(title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Text(interval)
                    .font(.system(size: 9, weight: .bold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(primaryBlue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }
            
            // Details Part
            Text(description)
                .font(.footnote)
                .foregroundColor(.gray)
                .lineSpacing(4)
        }
        .padding()
        .background(cardDark)
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(borderDark, lineWidth: 1))
    }
}

// Data Model to loop over it by foreach loop.
struct MaintenanceTask: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let interval: String
    let description: String
}

struct Screen1View: View {
    var body: some View {
        TabView {
            // Maintenace Tab
            MaintenanceListView()
                .tabItem {
                    Label("MAINTENANCE", systemImage: "wrench.and.screwdriver.fill")
                }
            
             // Practice Tab
            Screen2View()
                .tabItem {
                    Label("PRACTICE", systemImage: "flag.checkered")
                }
        }
        // Using my own color
        .tint(primaryBlue)
    }
}

// Maintenance Cards
struct MaintenanceListView: View {
    
    // I added essential Maintenance for a manual motorcycle
    let tasks: [MaintenanceTask] = [
        MaintenanceTask(iconName: "link", title: "DRIVE CHAIN", interval: "EVERY 500 KM", description: "A clean and properly tensioned chain ensures smooth power delivery and prevents premature wear of sprockets."),
        
        MaintenanceTask(iconName: "drop.fill", title: "ENGINE OIL", interval: "WEEKLY", description: "Maintaining correct oil levels and quality is critical for lubricating internal engine components."),
        
        MaintenanceTask(iconName: "tirepressure", title: "TIRE PRESSURE", interval: "WEEKLY", description: "Proper inflation is vital for handling, grip, and tire longevity. Always check pressures when cold."),
        
        MaintenanceTask(iconName: "cable.connector", title: "CLUTCH CABLE", interval: "MONTHLY", description: "Ensure the clutch engages smoothly. A well-lubricated cable prevents snapping and makes shifting gears effortless."),
        
        MaintenanceTask(iconName: "fluid.brakesignal", title: "BRAKE PADS & FLUID", interval: "MONTHLY", description: "Check brake pad wear indicators and ensure brake fluid is at the correct level in the reservoir for safe stopping power."),
        
        MaintenanceTask(iconName: "thermometer.medium", title: "COOLANT", interval: "1-2 YEARS", description: "Check the radiator coolant levels to prevent the engine from overheating during long rides or in heavy traffic."),
        
        MaintenanceTask(iconName: "wind", title: "AIR FILTER", interval: "EVERY 5,000 KM", description: "Clean or replace the air filter so your engine can breathe properly, ensuring optimal fuel efficiency and power."),
        
        MaintenanceTask(iconName: "minus.plus.batteryblock.fill", title: "BATTERY", interval: "MONTHLY", description: "Check terminals for corrosion and ensure it holds a proper charge so the electric starter works reliably."),
        
        MaintenanceTask(iconName: "lightbulb.fill", title: "LIGHTS & SIGNALS", interval: "BEFORE RIDE", description: "Check high/low beams, brake lights, and turn signals. Being visible to other drivers is your first line of defense."),
        
        MaintenanceTask(iconName: "gauge.with.needle", title: "THROTTLE CABLE", interval: "MONTHLY", description: "Ensure the throttle grip snaps back smoothly and instantly when released. A sticky throttle is very dangerous."),
        
        MaintenanceTask(iconName: "arrow.up.and.down", title: "FORK SEALS & SUSPENSION", interval: "MONTHLY", description: "Wipe down the front forks and check for any oil leaks. Leaking forks will drip oil directly onto your front brakes!"),
        
        MaintenanceTask(iconName: "bolt.fill", title: "SPARK PLUGS", interval: "EVERY 10,000 KM", description: "Responsible for igniting the fuel. Keep them clean for crisp acceleration. (Fun fact: your Pulsar 200NS actually uses 3 spark plugs!)"),
        
        MaintenanceTask(iconName: "wrench.adjustable.fill", title: "NUTS & BOLTS", interval: "MONTHLY", description: "Motorcycles vibrate a lot, which naturally loosens screws over time. Do a quick walk-around to tighten mirrors, fairings, and loose bolts."),
        
        MaintenanceTask(iconName: "bubbles.and.sparkles", title: "WASH & LUBE", interval: "WEEKLY", description: "Washing isn't just for looks. It prevents rust, protects electricals, and lets you spot missing bolts or leaks easily.")
    ]
    
    var body: some View {
        ZStack {
            // Using my own Custom BG
            bgDark.ignoresSafeArea()
            
            // Header of the app
            VStack(spacing: 0) {
                
                Text("PRIMESHIFT")
                    .font(.headline)
                    .fontWeight(.bold)
                    .tracking(2)
                    .foregroundColor(.white)
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                
                // Scrollable
                ScrollView(showsIndicators: false) {
                    
                    LazyVStack(spacing: 16) {
                        
                        // --- HERO CARD ---
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 16)
                                .fill(cardDark)
                                .overlay(RoundedRectangle(cornerRadius: 16).stroke(borderDark, lineWidth: 1))
                            
                            HStack {
                                Rectangle()
                                    .fill(Color.yellow)
                                    .frame(width: 4)
                                    .cornerRadius(2)
                                
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("CURRENT TRANSFORMER")
                                        .font(.caption2)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                        .padding(.leading, 5)
                                    
                                    HStack {
                                        Text("Kawasaki Bajaj Pulsar 200NS")
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding(.leading, 5)
                                        Spacer()
                                        Text("Bumblebee")
                                            .font(.subheadline)
                                            .fontWeight(.bold)
                                            .foregroundColor(.yellow)
                                    }
                                }
                                .padding(.vertical)
                                .padding(.trailing)
                            }
                        }
                        
                        // The ForEach loop creates a card for every item in the array on the fly.
                        ForEach(tasks) { task in
                            MaintenanceCard(
                                iconName: task.iconName,
                                title: task.title,
                                interval: task.interval,
                                description: task.description
                            )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 20) // Gives breathing room before the Tab Bar
                }
            }
        }
    }
}





#Preview {
    Screen1View()
        .preferredColorScheme(.dark)
}
