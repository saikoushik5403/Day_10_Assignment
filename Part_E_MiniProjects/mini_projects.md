# Part E — Mini Projects

This document details the architecture, features, and code files of the five mobile applications completed under Part E of the Day 10 assignment. All projects are fully implemented in the unified dashboard application:
[student_management_app/lib/main.dart](file:///C:/Users/koushik/day10-assignment/student_management_app/lib/main.dart)

---

## 1. Student Management App ⭐ (Capstone)

A multi-screen database application that represents the capstone project.

### Structural Flow:
```
[Home Screen Hub]
       │
       ▼ (Taps "View Student Records")
[Student List Screen] ──(Taps list row)──► [Student Details Screen]
```

### Key UI Components:
- **`HomeScreen`**: Features school icons and navigation buttons wrapped in clean elevation styles.
- **`StudentListScreen`**: Uses a dynamic `ListView.builder` returning `Card` widgets. Each card contains a `ListTile` displaying the first letter of the student's name in a circular avatar.
- **`StudentDetailsScreen`**: Receives student records via constructor parameters, rendering detailed listings (Course, Academic Year) on elevated cards.

---

## 2. Recipe Search App UI

Shows a browsable database of regional recipes with detailed instructions.

- **`RecipeListScreen`**: Renders a vertical scroll list of meal items including preparation time indicators. Tapping a recipe triggers constructor data passing.
- **`RecipeDetailsScreen`**: Renders large headers, preparation categories, and a summary list of ingredients.

---

## 3. Contacts App UI

Matches the contacts application layout of mobile.

- **`ContactsListScreen`**: Displays lists of user records with quick action phone buttons.
- **`ContactDetailsScreen`**: Centers details (name, phone number) on top of vertical layout columns.

---

## 4. Multi-Screen Portfolio App

Translates our Day 6 personal portfolio website into a mobile application.

- **`PortfolioHomeScreen`**: Centers personal avatar, name, and role description. Includes buttons to push projects and contact screens.
- **`ProjectsScreen`**: ListView of projects displaying descriptive subtitles and web URLs.
- **`ContactScreen`**: Displays contact details (email, location details).

---

## 5. Student Task Manager UI (Day 8 Plan)

Brings the **SpendSmart/TaskManager** app planned on Day 8 to life!

- **Stateful List**: Stays in a `StatefulWidget` to allow dynamic task updates.
- **Dynamic Deletion**: Tapping the trash icon triggers `setState()`, updating lists instantly.
- **Floating Action Button**: Taps add new task templates with timestamps.
- **Clean Separation**: Isolates task logic, displaying clear visual checkboxes on cards.
