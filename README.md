# Day 10 Assignment — UI Components & Navigation in Flutter

## Overview

This repository contains the complete Day 10 assignment (Assignment 39) covering **UI Components and Navigation in Flutter**. This is the final day of the **Foundation Training Phase**.

All six parts (A to F) have been completed and organized inside the `day10-assignment` directory.

---

## Repository Structure

```
day10-assignment/
├── Part_A_Theory/
│   └── theory_answers.md               ← 10 detailed theory Q&A
│
├── Part_B_Exercises/
│   └── practical_exercises.md          ← Row, Column, Stack, ListView, GridView layouts
│
├── Part_C_Challenges/
│   └── ui_challenges.md                ← Profile Card, Login Form, Settings, Product Grid code
│
├── Part_D_Navigation/
│   └── navigation_challenges.md        ← Push/Pop, Named Routes, Constructor Data Passing code
│
├── Part_E_MiniProjects/
│   └── mini_projects.md                ← Student Manager, Recipe, Contacts, Portfolio, and Task apps
│
├── Part_F_Research/
│   └── research_notes.md               ← Research on go_router, Wrap, MediaQuery, SafeArea, Provider
│
├── student_management_app/
│   └── lib/
│       └── main.dart               ← 🚀 COMPLETE MASTER APP CONTAINING ALL RUNNABLE PAGES
│
├── .gitignore
└── README.md
```

---

## The Master Application Hub

To keep the codebase clean, professional, and easy to run, **all exercises, challenges, and mini-projects are built into a single, unified MaterialApp** inside `student_management_app/lib/main.dart`.

### Features of the Master App:
1. **Assignment Hub Dashboard**: A clean starting menu linking to all parts of the lab.
2. **Left Drawer Navigation**: Houses quick drawer shortcuts to launch the Part E Mini Projects.
3. **Fully Runnable Screens**:
   - **Part B & C**: Interactive layout visualizers for Row alignments, Column Expanded, Stack badges, ListViews, GridViews, Profile Cards, and Product Cards.
   - **Part D**: Navigational flows showing push/pop, constructor arguments, and pop return values.
   - **Part E**: Runnable capstone projects:
     - **Student Management App**: Full list-to-detail navigation flow.
     - **Recipe App**: Recipe database.
     - **Contacts App**: Mobile contact list.
     - **Multi-Screen Portfolio**: Portable personal portfolio.
     - **Student Task Manager**: Stateful task manager with dynamic additions and swipe deletions.

---

## How to Run

1. Ensure you have the Flutter SDK configured.
2. Navigate to the app directory:
   ```bash
   cd student_management_app/
   ```
3. Launch the app on a connected device/emulator:
   ```bash
   flutter run
   ```

*Submitted as part of the Web & Mobile Development Course — Day 10 Assignment.*
