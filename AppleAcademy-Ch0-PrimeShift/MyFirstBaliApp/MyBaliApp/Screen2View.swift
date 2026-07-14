//
//  Screen2View.swift
//  MyBaliApp
//
//  Created by Ivan on 03/03/26.
//  Refactored by Morad developer for PrimeShift App
//

import SwiftUI

// Reusable practice card
struct PracticeLogCard: View {
    let log: PracticeLog
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(log.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                    
                    Text("SKILL: " + log.maneuver)
                        .font(.caption2)
                        .fontWeight(.bold)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(primaryBlue.opacity(0.2))
                        .foregroundColor(primaryBlue)
                        .clipShape(Capsule())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("DETAILS:")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        Text(log.details)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .lineLimit(2)
                    }
                    .padding(.top, 8)
                }
                
                Spacer()
                
                Text(log.date)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                    .padding(.top, 2)
            }
            
            Divider()
                .background(borderDark)
                .padding(.vertical, 2)
            
            HStack {
                HStack(spacing: 6) {
                    Image(systemName: "clock.fill")
                        .foregroundColor(primaryBlue)
                        .font(.caption)
                    Text(log.duration)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                HStack(spacing: 6) {
                    Image(systemName: "road.lanes")
                        .foregroundColor(primaryBlue)
                        .font(.caption)
                    Text(log.distance)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(cardDark)
        .cornerRadius(16)
        .overlay(RoundedRectangle(cornerRadius: 16).stroke(borderDark, lineWidth: 1))
    }
}

// Data model, to loop over it
struct PracticeLog: Identifiable {
    let id = UUID()
    let date: String
    let title: String
    let maneuver: String
    let duration: String
    let distance: String
    let details: String
}

struct Screen2View: View {
    
    // Cards to loop over (displayed cards)
    let logs: [PracticeLog] = [
        PracticeLog(date: "10 Mar 2026", title: "Empty Lot Drills", maneuver: "Friction Zone & U-Turns", duration: "45 mins", distance: "5 km", details: "Struggled a bit with stalling on the tight right U-turns. Need to remember to drag the rear brake and keep my head turned looking where I want to go, not at the ground."),
        PracticeLog(date: "08 Mar 2026", title: "Traffic Practice", maneuver: "Rev Matching Downshifts", duration: "1 hr 20 mins", distance: "15 km", details: "Much smoother today. Blipping the throttle is starting to feel like muscle memory instead of something I have to actively think about before every stoplight."),
        PracticeLog(date: "05 Mar 2026", title: "Highway Intro", maneuver: "High-Speed Braking", duration: "30 mins", distance: "2 km", details: "Practiced progressive braking from 80km/h. Squeezing the front brake smoothly rather than grabbing it. Felt very stable.")
    ]
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                bgDark.ignoresSafeArea()
                
                VStack(spacing: 0) {
                    
                    HStack {
                        Text("PRACTICE LOG")
                            .font(.headline)
                            .fontWeight(.bold)
                            .tracking(2)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    .padding(.top, 10)
                    .padding(.bottom, 20)
                    
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 16) {
                            ForEach(logs) { log in
                                // making each log clickable
                                NavigationLink(destination: PracticeDetailView(log: log)) {
                                    // passing the log
                                    PracticeLogCard(log: log)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 20)
                    }
                    
                    Spacer()

                    Button(action: {
                        print("Add button tapped - functionality coming soon!")
                    })
                    {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(primaryBlue)
                    }
                    .padding(.bottom, 25)
                }
            }
        }
    }
}

// Detailed view screen
struct PracticeDetailView: View {
    // Passed in log data
    let log: PracticeLog
    
    var body: some View {
        ZStack {
            bgDark.ignoresSafeArea()
            
            VStack(spacing: 24) {
                // Header Group
                VStack(alignment: .leading, spacing: 8) {
                    Text(log.date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(log.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Text("SKILL: " + log.maneuver)
                        .font(.callout)
                        .fontWeight(.bold)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(primaryBlue.opacity(0.2))
                        .foregroundColor(primaryBlue)
                        .clipShape(Capsule())
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Stat Boxes
                HStack(spacing: 16) {
                    // Duration Box
                    VStack(alignment: .leading, spacing: 8) {
                        Image(systemName: "clock.fill")
                            .foregroundColor(primaryBlue)
                        Text("DURATION")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Text(log.duration)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(cardDark)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(borderDark, lineWidth: 1))
                    
                    // Distance Box
                    VStack(alignment: .leading, spacing: 8) {
                        Image(systemName: "road.lanes")
                            .foregroundColor(primaryBlue)
                        Text("DISTANCE")
                            .font(.caption2)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Text(log.distance)
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .background(cardDark)
                    .cornerRadius(12)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(borderDark, lineWidth: 1))
                }
                .padding(.horizontal)
                
                // Full Details Area
                VStack(alignment: .leading, spacing: 12) {
                    Text("SESSION NOTES")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text(log.details)
                        .font(.body)
                        .foregroundColor(.white)
                        .lineSpacing(6)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(cardDark)
                .cornerRadius(16)
                .overlay(RoundedRectangle(cornerRadius: 16).stroke(borderDark, lineWidth: 1))
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    Screen2View()
        .preferredColorScheme(.dark)
}


