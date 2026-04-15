# 🤝 Challenge 1 — Help an Academy Friend

> **Apple Developer Academy** · Challenge 1  
> *Read someone else's code, understand it, and extend it — a core developer skill.*

---

## 📖 About

**Help an Academy Friend** takes the same **Academy Eats** codebase from Challenge 0 and asks you to step into a peer's shoes. The challenge isn't writing new code from scratch — it's *reading* unfamiliar SwiftUI code, understanding what every line does, and then being able to explain and build on top of it.

This mirrors real-world team development, where you spend as much time reading code as writing it.

---

## 🎯 Learning Objectives

| Concept | What you practice |
|---|---|
| Code reading | Navigating an unfamiliar Xcode project confidently |
| `NavigationStack` | Understanding navigation container behavior |
| `List` + `HStack` | Decomposing row-based layouts |
| `Image` (asset catalog) | Tracing where assets come from and how they're displayed |
| Pair / peer programming | Explaining code choices out loud to a partner |
| SwiftUI preview | Using `#Preview` to rapidly inspect UI without running the full app |

---

## 🗂️ Project Structure

```
AppleAcademy-Ch1-HelpAnAcademyFriend/
├── PrimeShift.xcodeproj/          # Xcode project file
└── PrimeShift/
    ├── PrimeShiftApp.swift        # @main entry point
    ├── ContentView.swift          # Academy Eats list screen (inherited from Ch0)
    └── Assets.xcassets/
        ├── biker.imageset/        # Image asset used in the list
        ├── AppIcon.appiconset/    # App icon
        └── AccentColor.colorset/  # Global tint color
```

---

## 📱 The Screen

The running app is identical to Challenge 0 — **Academy Eats**, a scrollable list with a biker photo and label. The difference is the *process*: you are now the one receiving the project and must:

1. Open it cold in Xcode
2. Identify every view, modifier, and asset
3. Explain the data flow to a classmate
4. Suggest or implement a small improvement

```
┌────────────────────────────┐
│  Academy Eats              │
├────────────────────────────┤
│  [🖼 100×100]  An OG Biker │
│                            │
└────────────────────────────┘
```

---

## 🔑 Key Code

```swift
// ContentView.swift — read this carefully!
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

**Questions to answer while reading:**
- Why is `NavigationStack` the outermost view?
- What does `.resizable()` do before `.frame()`?
- What would happen if you removed the `HStack`?

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
