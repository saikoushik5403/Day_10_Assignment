# Part D — Navigation Challenges

This document details the code logic and workflows for the five Navigation Challenges under Part D of the Day 10 assignment. All challenges are fully implemented in the unified dashboard application:
[student_management_app/lib/main.dart](file:///C:/Users/koushik/day10-assignment/student_management_app/lib/main.dart)

---

## 1. Two-Screen App with navigation using Navigator.push and pop

Shows basic screen transitions. Pushing adds Screen B onto the stack, and popping Screen B returns back to Screen A.

```dart
// Screen A pushes Screen B
ElevatedButton(
  onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const TwoScreenNavigationB()));
  },
  child: const Text('Push Screen B'),
)

// Screen B pops itself
ElevatedButton(
  onPressed: () {
    Navigator.pop(context);
  },
  child: const Text('Pop Back to A'),
)
```

---

## 2. Converting navigation to use named routes registered in MaterialApp

Screens are mapped to named keys in the root registry, allowing string-based navigation calls instead of verbose page route builders.

```dart
// Registered in MaterialApp
routes: {
  '/': (context) => const DashboardHubScreen(),
  '/settings': (context) => const SettingsChallengeScreen(),
  '/login': (context) => const LoginChallengeScreen(),
}

// Navigated by name
Navigator.pushNamed(context, '/settings');
```

---

## 3. List-to-Details flow that passes data through the constructor

Tapping a ListTile record instantiates the details screen, passing parameters (like name and course details) directly inside the class constructor.

```dart
// Source List Screen: Push passing data
ListTile(
  title: Text(students[index]['name']!),
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentDetailsScreen(studentName: students[index]['name']!),
      ),
    );
  },
)

// Destination Details Screen: Accept parameters
class StudentDetailsScreen extends StatelessWidget {
  final String studentName;
  const StudentDetailsScreen({super.key, required this.studentName});
  // uses studentName inside the build method
}
```

---

## 4. Home screen that navigates to three different screens

Demonstrated on the **Master Hub Screen** (`DashboardHubScreen`) and the **Student Management Capstone Screen** (`StudentManagementHomeScreen`). It acts as a central hub (spoke) linking to distinct sub-screens (Students List, User Profile, Settings).

---

## 5. Screen that returns data when it pops, received by the previous screen

Demonstrates bidirectional data flow. Screen A pushes Screen B and awaits a return value asynchronously. When Screen B pops, it returns a message string that Screen A captures and renders.

```dart
// Screen A: Await push response
ElevatedButton(
  onPressed: () async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ReturnValueDestinationScreen()),
    );
    if (result != null) {
      setState(() {
        returnedMessage = 'Returned Value: $result';
      });
    }
  },
  child: const Text('Get Data from Screen B'),
)

// Screen B: Pop with return value
ElevatedButton(
  onPressed: () => Navigator.pop(context, 'Success Status Code 200'),
  child: const Text('Pop Back with Success'),
)
```
