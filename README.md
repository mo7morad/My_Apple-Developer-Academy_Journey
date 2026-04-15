# <img src="https://img.icons8.com/?size=100&id=30840&format=png&color=808080" width="20" style="vertical-align:middle;" />  Apple Developer Academy — Challenges

> A collection of SwiftUI challenges completed during the **Apple Developer Academy** program.  
> Each folder is a self-contained Xcode project that progressively builds iOS development skills.

---

## 🗺️ Challenges at a Glance

| # | Folder | App Name | Core Concepts |
|---|---|---|---|
| 0 | [`AppleAcademy-Ch0-PrimeShift`](./AppleAcademy-Ch0-PrimeShift) | Academy Eats | `NavigationStack`, `List`, `HStack`, `Image`, assets |
| 1 | [`AppleAcademy-Ch1-HelpAnAcademyFriend`](./AppleAcademy-Ch1-HelpAnAcademyFriend) | Academy Eats (Sketch design) | Sketch, UI/UX design, asset export, peer feedback |
| 2 | [`AppleAcademy-Ch2-Contacts`](./AppleAcademy-Ch2-Contacts) | Contacts | `Dictionary(grouping:)`, sectioned `List`, toolbar, search |

---

## 📚 Challenge Summaries

### [Challenge 0 — PrimeShift (Academy Eats)](./AppleAcademy-Ch0-PrimeShift)

The **first SwiftUI screen**, built from zero. A scrollable restaurant list that pairs a photo with a label, wrapped in a navigation stack. The goal: get comfortable with Xcode and SwiftUI's declarative view hierarchy before adding any logic.

**Key views:** `NavigationStack` › `List` › `HStack` › `Image` + `Text`

---

### [Challenge 1 — Help an Academy Friend](./AppleAcademy-Ch1-HelpAnAcademyFriend)

A **design challenge** built around **Sketch** — the vector design tool used throughout the Academy. Starting from the Academy Eats screen produced in Challenge 0, the task is to recreate and improve that UI inside Sketch: defining artboards, building reusable symbols, applying text styles, and exporting assets for Xcode.

The collaborative twist: you share your design with a classmate, gather feedback, and iterate — practising the designer ↔ developer handoff loop that underpins real product teams.

**Key skills:** Sketch artboards & symbols, visual hierarchy, `@1x/@2x/@3x` asset export, peer design critique

---

### [Challenge 2 — Contacts](./AppleAcademy-Ch2-Contacts)

A **clone of Apple's Contacts app** built in two stages:

1. **Static** (`AcademyVersion.swift`) — hardcoded contacts and sections, built by hand to understand the exact structure.
2. **Dynamic** (`DictionaryViewVersion.swift`) — the same UI powered by `Dictionary(grouping:)`, making it trivial to add or remove contacts.

**Key concepts:** Alphabetical `Section` lists, scrubber index, native search bar, bottom toolbar, and Swift's `Dictionary(grouping:)` API.

---

## 🛠️ Tech Stack

| Item | Details |
|---|---|
| Language | Swift 5.9+ |
| UI Framework | SwiftUI |
| Minimum OS | iOS 17+ |
| IDE | Xcode 15+ |

---

## 🚀 Getting Started

```bash
# 1. Clone the repo
git clone https://github.com/mo7morad/Apple-Developer-Academy-Challenges.git

# 2. Open any challenge in Xcode
open AppleAcademy-Ch0-PrimeShift/PrimeShift.xcodeproj
```

Then pick an iPhone simulator and press **⌘ R**.

---

## 📁 Repository Structure

```
Apple-Developer-Academy-Challenges/
├── AppleAcademy-Ch0-PrimeShift/          # Challenge 0
│   ├── README.md
│   └── PrimeShift/
├── AppleAcademy-Ch1-HelpAnAcademyFriend/ # Challenge 1
│   ├── README.md
│   └── PrimeShift/
└── AppleAcademy-Ch2-Contacts/            # Challenge 2
    ├── README.md
    └── Contacts/
```

Each challenge folder contains its own `README.md` with a deeper breakdown of the code, concepts, and screenshots.

---

## 👤 Author

**Mohamed Morad** — Apple Developer Academy student  
Contributions from: Javier Fransiscus (Ch2 static view)

---

*Challenges are numbered from 0 because developers start counting from zero. 🙂*
