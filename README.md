# <img src="https://img.icons8.com/?size=100&id=30840&format=png&color=808080" width="20" style="vertical-align:middle;" />  Apple Developer Academy — Challenges

> My Journey through Apple Developer Academy challenges spanning both **design** and **SwiftUI development**.  
> Most folders are self-contained Xcode projects.

---

## 🗺️ Challenges at a Glance

| # | Folder | App Name | Core Concepts |
|---|---|---|---|
| 0 | [`AppleAcademy-Ch0-PrimeShift`](./AppleAcademy-Ch0-PrimeShift) | PrimeShift (2 Screen App) | `NavigationStack`, `List`, `HStack`, `Image`, assets |
| 1 | [`AppleAcademy-Ch1-HelpAnAcademyFriend`](./AppleAcademy-Ch1-HelpAnAcademyFriend) | Individual Design (Sketch) | UI/UX design, Sketch artboards, design-to-dev handoff |
| 2 | [`AppleAcademy-Ch2-Contacts`](./AppleAcademy-Ch2-Contacts) | Contacts | `Dictionary(grouping:)`, sectioned `List`, toolbar, search |
| 3 | [`AppleAcademy-Ch3-Nutrition`](./AppleAcademy-Ch03-Nutrition/Ch03%20-%20Gym%20Nutrition) | Numo (Gym Nutrition Tracker) | Modular architecture, SwiftUI, health goals |
| 4 | [`AppleAcademy-Ch4-iStack`](./AppleAcademy-Ch04-iStack/Distill) | Distill (iPadOS Painting App) | `CoreGraphics`, `PencilKit`, `AVFoundation`, iPadOS UI |

---

## 📚 Challenge Summaries

### [Challenge 0 — PrimeShift](./AppleAcademy-Ch0-PrimeShift)
Was the first challenge I completed this individual challenge. The app was from my choice, and I chose to create this to help me maintain my manual motorcycle maintenance checkups, for each part, also log my learning journey, of how to ride a manual motorcycle.

**Key views:** `NavigationStack` › `List` › `HStack` › `Image` + `Text`

---

### [Challenge 1 — Help an Academy Friend](./AppleAcademy-Ch1-HelpAnAcademyFriend)

A TEAM project introduction to **UI/UX design** using **Sketch** . This challenge focused on teaching us empathy, and that we are creating for a user that who has specific needs and we need to address them, and help this friend. learning the Sketch design tool — artboards, UI components, typography, spacing, and visual hierarchy — and producing an individual design file that captures one or more app screens.

**Key skill:** 
Empathy and user-centered design.
Wireframing and visual design in Sketch, preparing assets and layouts for developer handoff.

---

### [Challenge 2 — Contacts](./AppleAcademy-Ch2-Contacts)

A (DUO) project **clone with a remix of Apple's Contacts app** built in two stages:

1. **Static** (`AcademyVersion.swift`) — hardcoded contacts and sections, built by hand to understand the exact structure.
2. **Dynamic** (`DictionaryViewVersion.swift`) — the same UI powered by `Dictionary(grouping:)`, making it trivial to add or remove contacts.

**Key concepts:** Alphabetical `Section` lists, scrubber index, native search bar, bottom toolbar, and Swift's `Dictionary(grouping:)` API.

---

### [Challenge 3 — Numo (Gym Nutrition Tracker)](./AppleAcademy-Ch03-Nutrition/Ch03%20-%20Gym%20Nutrition)

An iOS application designed to help gym-goers and fitness enthusiasts track their daily nutrition and maintain a healthy lifestyle. This project emphasizes a clean separation of concerns and robust UI development.

**Key concepts:** Modular SwiftUI architecture (App, Core, DesignSystem, Features), health tracking, and custom design components.

---

### [Challenge 4 — Distill (iPadOS Painting & Multimedia)](./AppleAcademy-Ch04-iStack/Distill)

A team iPadOS application built around multimedia and drawing capabilities. It combines CoreGraphics and PencilKit for a responsive canvas with AVFoundation to provide a rich media experience.

**Key concepts:** iPadOS specific layouts, `PencilKit` drawing, `AVFoundation` media integration, and system constraints handling.

---

## 🚀 Getting Started

```bash
# 1. Clone the repo
git clone https://github.com/mo7morad/Apple-Developer-Academy-Challenges.git

# 2. Open any challenge in Xcode
open AppleAcademy-Ch0-PrimeShift/PrimeShift.xcodeproj
```

Then pick an iPhone simulator (or an iPad simulator for Challenge 4) and press **⌘ R**.

---

## 📁 Repository Structure

```
Apple-Developer-Academy-Challenges/
├── AppleAcademy-Ch0-PrimeShift/          # Challenge 0
│   ├── README.md
│   └── PrimeShift/
├── AppleAcademy-Ch1-HelpAnAcademyFriend/ # Challenge 1 (Design in Sketch)
│   ├── README.md
│   └── My individual Design.sketch
├── AppleAcademy-Ch2-Contacts/            # Challenge 2
│   ├── README.md
│   └── Contacts/
├── AppleAcademy-Ch03-Nutrition/          # Challenge 3
│   └── Ch03 - Gym Nutrition/
│       ├── README.md
│       └── Numo/
└── AppleAcademy-Ch04-iStack/             # Challenge 4
    └── Distill/
        ├── README.md
        └── Project/
```

Each challenge folder contains its own `README.md` with a deeper breakdown of the code, concepts, and screenshots.

---

## 👤 Author

**Mohamed Morad** — Apple Developer Academy student  
