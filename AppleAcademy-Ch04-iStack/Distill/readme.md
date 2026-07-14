<div align="center">

# Distill - iPadOS Painting & Multimedia 🎨

[![Swift](https://img.shields.io/badge/Swift-F05138?style=flat-square&logo=swift&logoColor=white)](https://developer.apple.com/swift/)
[![iPadOS](https://img.shields.io/badge/iPadOS-000000?style=flat-square&logo=apple&logoColor=white)](https://developer.apple.com/ipados/)
[![AVFoundation](https://img.shields.io/badge/AVFoundation-blue?style=flat-square)](https://developer.apple.com/documentation/avfoundation)
[![PencilKit](https://img.shields.io/badge/PencilKit-orange?style=flat-square)](https://developer.apple.com/documentation/pencilkit)

[Overview](#overview) • [Features](#features) • [Getting started](#getting-started) • [Technical Report](#technical-report-the-exploration-log)

</div>

## Overview

Distill is an iPadOS application built around multimedia and drawing capabilities using **CoreGraphics** and **PencilKit**, combined with **AVFoundation** for rich media experiences.

This project was developed by a team to explore integrating multiple complex frameworks to deliver an optimized iPadOS application with Apple Pencil support.

## Features

- **Interactive Canvas**: Draw and paint seamlessly using Apple Pencil on iPadOS.
- **Multimedia Integration**: Incorporates videos and rich media for a holistic experience.
- **Daily Constraints**: Built-in limits for daily painting sessions to encourage consistent habits (from the `feat/limit-painting-for-one-each-day` branch).

## Getting started

To run the project locally:

1. Open `Distill.xcodeproj` inside the `Project/` folder in Xcode.
2. Select an **iPad simulator** (required for the best experience).
3. Press **⌘ R** to build and run the app.

> [!IMPORTANT]
> The app is heavily optimized for iPadOS. Running it on an iPhone simulator may cause unexpected layout issues.

---

## Technical Report: The Exploration Log

> [!NOTE]
> **Before you start:** Fill in Section 1 early. Once you move on to Section 2, don't go back and edit Section 1. The gap between what you guessed and what you actually found is the point of this whole document.

### Present your team
Rania Na Vitha Shafrial Azis, Mohamed Morad (Moe)

### Starting Assumption
*What did you assume, before any real exploration (start of investigation phase)?*
We thought we'll end up using: Things related to pure media, like videos and audios, and how to tinker around with them.
Because: It sounded obvious since we chose the multimedia framework.

### The Exploration Log
*What we actually built or tested in code (not just read about):*
We tried to implement the AVPlayer and see how the media plays and how the AVPlayer works.

*What we discovered that we didn't expect:*
There are so many layers from AVFoundation to play media like video. It is not just about a simple play and pause the video at front, but there are so many events happening in the back there. For instance, video is essentially frames shown fast enough to fool our brain. A single raw frame at 1920X1080 (3 bytes/pixel) has a 6MB size. At 24fps, one minute of raw video = ~8.6 GB! This is why codecs and containers (like .mp4 or .mov) are essential to compress video and hold tracks, timing, and metadata.

### What We Tried and Dropped
*We considered:*
Having image classification. Based on what the user wants pictures with (e.g., a specific person), we view only the pics that include them and the selected people.

*We dropped it because:*
While the Photos app has this feature of image recognition and binding the image with people, as a 3rd party app, we don't have access to this meta-data. Also, having an LLM that does classification and recognition is very complex, so we dropped it twice ^__^

### Real Limitations Hit
*What broke, what didn't behave the way the documentation said it would:*
We initially planned to let users filter photos by selecting specific people (for example, "show me only photos with Ahmed and Sarah"). However, during development we discovered that third-party iOS apps cannot access the Photos app's person-recognition metadata. We also explored using an AI/LLM-based image recognition system to identify people ourselves, but implementing a reliable face recognition pipeline was far beyond the scope and complexity of our project.

*How we worked around it:*
We removed the people-based filtering feature from our application and redesigned the experience around capabilities that are available through Apple's public APIs. This allowed us to focus on features that could be implemented reliably while keeping the app performant and maintainable.

### The Revised Decision
*Final decision:*
CoreGraphics, MultiMedia, and iPadOS.

*What changed since Section 1, and why:*
We integrated with other frameworks to make our app suitable for the user. For example, we chose iPadOS and CoreGraphics for drawing because of the bigger screen and the Apple Pencil.

### App Track Addendum
#### About the Frameworks
*Does your use case genuinely need both frameworks working together?*
**Yes. Our use case genuinely needs both frameworks working together.** While the Multimedia framework provides the core functionality for accessing and working with media, the **iPadOS** framework and CoreGraphics for PencilKit enhances the experience by taking advantage of iPad-specific capabilities such as larger screen layouts, multitasking, and a more productive interface. The app could technically function using only the Multimedia framework, but it would not deliver the intended user experience on iPad. Therefore, both frameworks contribute to the final product, with Multimedia powering the core functionality and iPadOS improving usability and interaction.

#### About Privacy
*What data does your app actually need?*
Gallery access, to allow the user to pick images from it.
