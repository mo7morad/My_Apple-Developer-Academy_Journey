# 🍕 Challenge 0 — PrimeShift (Academy Eats)

> **Apple Developer Academy** · Challenge 0  
> *Your very first SwiftUI screen — a restaurant list built from scratch.*

---

## 📖 About

**Academy Eats** is the entry-point challenge of the Apple Developer Academy program. The goal is to get comfortable with Xcode, SwiftUI's declarative syntax, and the basic building blocks every iOS app relies on: `NavigationStack`, `List`, `HStack`, `Image`, and `Text`.

No logic. No state. Pure UI. The perfect zero-to-one moment.

---

## 🎯 Learning Objectives

| Concept | What you practice |
|---|---|
| `NavigationStack` | Setting up a navigation-aware screen hierarchy |
| `List` | Rendering scrollable rows of content |
| `HStack` | Laying out views horizontally side-by-side |
| `Image` (asset catalog) | Loading and displaying local image assets |
| `.resizable()` / `.frame()` | Controlling image dimensions |
| `.navigationTitle()` | Adding a large title to the navigation bar |

---

## 🗂️ Project Structure

```
AppleAcademy-Ch0-PrimeShift/
├── PrimeShift.xcodeproj/          # Xcode project file
└── PrimeShift/
    ├── PrimeShiftApp.swift        # @main entry point
    ├── ContentView.swift          # Single screen — the Academy Eats list
    └── Assets.xcassets/
        ├── biker.imageset/        # "An OG Biker" photo
        ├── AppIcon.appiconset/    # App icon
        └── AccentColor.colorset/  # Global tint color
```

---

## 📱 What the App Looks Like

The app opens a single screen titled **"Academy Eats"** containing a scrollable `List`. Each row pairs a square thumbnail (the `biker` image) with the label **"An OG Biker"**, laid out using an `HStack`.

```
┌────────────────────────────┐
│  Academy Eats              │  ← navigationTitle
├────────────────────────────┤
│  [🖼 100×100]  An OG Biker │  ← HStack row inside List
│                            │
└────────────────────────────┘
```

---

## 🔑 Key Code

```swift
// ContentView.swift
NavigationStack {
    List {
        HStack {
            Image("biker")
                .resizable()
                .frame(width: 100, height: 100)
                .scaledToFit()
            Text("An OG Biker")
        }
    }
    .navigationTitle(Text("Academy Eats"))
}
```

---

## 🚀 How to Run

1. Open `PrimeShift.xcodeproj` in **Xcode 15+**
2. Select any iPhone simulator (e.g. *iPhone 16*)
3. Press **⌘ R**

---

## 🛠️ Tech Stack

- **Language:** Swift 5.9+
- **UI Framework:** SwiftUI
- **Minimum Deployment:** iOS 17+
- **Xcode:** 15+

---

*Created by Mohamed Morad · Apple Developer Academy*
