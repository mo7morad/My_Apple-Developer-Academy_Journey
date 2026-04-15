# 🤝 Challenge 1 — Help an Academy Friend

> **Apple Developer Academy** · Challenge 1  
> *Learn Sketch, design a UI, and help a peer bring their idea to life.*

---

## 📖 About

**Help an Academy Friend** is a design challenge centred on **Sketch** — the industry-standard vector design tool used for creating app interfaces. Rather than writing Swift code from scratch, the focus here is on the *design layer*: understanding UI components, crafting layouts, and producing a polished screen prototype that a developer could hand off to Xcode.

The challenge also carries a collaborative spirit: you use your new Sketch skills to help a classmate visualise or improve *their* app idea, reinforcing the feedback loop between designer and developer.

---

## 🎯 Learning Objectives

| Concept | What you practice |
|---|---|
| Sketch fundamentals | Artboards, shapes, text styles, and component libraries |
| UI layout | Spacing, alignment, and visual hierarchy on a mobile canvas |
| Asset export | Slicing and exporting images/icons for use in Xcode |
| Design thinking | Translating a feature idea into a concrete, reviewable screen |
| Peer collaboration | Giving and receiving design feedback with a classmate |
| Developer handoff | Annotating designs so a developer can implement them accurately |

---

## 🗂️ Project Structure

```
AppleAcademy-Ch1-HelpAnAcademyFriend/
├── PrimeShift.xcodeproj/          # Reference Xcode project (Academy Eats from Ch0)
└── PrimeShift/
    ├── PrimeShiftApp.swift        # @main entry point
    ├── ContentView.swift          # Academy Eats list screen (reference code)
    └── Assets.xcassets/
        ├── biker.imageset/        # Image asset used in the list
        ├── AppIcon.appiconset/    # App icon
        └── AccentColor.colorset/  # Global tint color
```

> The Xcode project is kept as a **reference implementation** — the primary deliverable of this challenge is the Sketch design file and any exported assets.

---

## 🎨 The Design Task

Using the **Academy Eats** app from Challenge 0 as a starting point, the goal is to:

1. Open Sketch and create a new **mobile artboard** (375 × 812 pt — iPhone standard)
2. Recreate the existing Academy Eats screen as a Sketch design
3. Propose and design **at least one improvement** (e.g. a detail screen, better typography, or a new colour palette)
4. Export assets and share the design with a classmate for feedback
5. Iterate based on the feedback received

```
┌────────────────────────────┐
│  Academy Eats              │  ← Navigation bar (title)
├────────────────────────────┤
│  [🖼 100×100]  An OG Biker │  ← List row with image + label
│                            │
└────────────────────────────┘
         ↓ design in Sketch ↓
  [ artboard · components · styles ]
```

---

## 🖌️ Key Sketch Concepts Used

- **Artboards** — defining the iPhone canvas size and safe areas
- **Symbols** — reusable components for navigation bars, list rows, and icons
- **Text Styles** — consistent typography across the design
- **Layer Groups** — organising the layer panel to mirror SwiftUI's view hierarchy
- **Export Slices** — generating `@1x / @2x / @3x` assets for Xcode's asset catalog

---

## 🚀 How to Open the Reference App

If you want to run the existing code as a design reference:

1. Open `PrimeShift.xcodeproj` in **Xcode 15+**
2. Select any iPhone simulator (e.g. *iPhone 16*)
3. Press **⌘ R**

---

## 🛠️ Tools

| Tool | Purpose |
|---|---|
| **Sketch** | UI/UX design and prototyping |
| Xcode 15+ | Running the reference implementation |
| Swift / SwiftUI | Reference code language & framework |
| iOS 17+ | Target platform |

---

*Created by Mohamed Morad · Apple Developer Academy*
