<div align="center">

# Numo - Gym Nutrition Tracker 🥗💪

[![Swift](https://img.shields.io/badge/Swift-F05138?style=flat-square&logo=swift&logoColor=white)](https://developer.apple.com/swift/)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-blue?style=flat-square&logo=swift)](https://developer.apple.com/xcode/swiftui/)
[![SwiftData](https://img.shields.io/badge/SwiftData-000000?style=flat-square&logo=apple&logoColor=white)](https://developer.apple.com/xcode/swiftdata/)

[Overview](#overview) • [Features](#features) • [Getting started](#getting-started) • [Project Structure](#project-structure)

</div>

## Overview

Numo is an iOS application designed to help gym-goers and fitness enthusiasts track their daily nutrition and maintain a healthy lifestyle. This project emphasizes a clean separation of concerns and robust UI development using a modular SwiftUI architecture.

> [!NOTE]
> This app heavily relies on SwiftData for persistence, ensuring all your daily meals and profile data are stored securely on-device.

## Features

- **Nutrition Tracking**: Log daily meals, calories, and macronutrients.
- **Personalized Goals**: Set and monitor fitness and diet goals.
- **Progress Insights**: Visualize nutrition habits over time with charts and streaks.
- **SwiftData Persistence**: Offline-first, fast database interactions.

## Getting started

To run the project locally:

1. Open `Numo.xcodeproj` in **Xcode 15+**.
2. Select your preferred iPhone simulator.
3. Press **⌘ R** to build and run the app.

> [!IMPORTANT]
> If you experience a crash in Xcode previews, ensure that your preview uses the in-memory `ModelContainer` configured in the project.

## Project Structure

```
AppleAcademy-Ch03-Nutrition/Ch03 - Gym Nutrition/
├── README.md
├── Numo.xcodeproj/
└── Numo/
    ├── App/
    ├── Core/
    ├── DesignSystem/
    ├── Features/
    └── Resources/
```
