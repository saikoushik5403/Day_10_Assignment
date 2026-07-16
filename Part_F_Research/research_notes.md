# Part F — Research Activities: UI & Navigation

This document compiles the research findings for the five research activities assigned under Part F of the Day 10 assignment.

---

## 1. The `go_router` Package

[`go_router`](https://pub.dev/packages/go_router) is a popular, declarative routing package for Flutter created and maintained by the Flutter team. It is built on top of the framework's native Router API (Navigator 2.0).

### How it improves navigation in larger apps:
1. **Declarative Routing**: You define routes as a single configuration tree, matching screen paths to parameters automatically.
2. **Easy Deep Linking**: Handles URL routes natively. Tapping a link like `/profile/user123` opens the correct page instantly with arguments extracted.
3. **Shell Routes (Nested Navigation)**: Allows keeping persistent UI elements (like bottom bars or side drawers) on screen while changing only the inner content body.
4. **Clean Redirection**: Integrates redirects for authentication (e.g. sending unauthenticated users to `/login` if they try to access `/dashboard`).

---

## 2. The `Wrap` Widget

The `Wrap` widget arranges its children in a linear flow, but unlike `Row` or `Column` which will overflow if children exceed space, `Wrap` **automatically breaks to a new line** (or column) once it runs out of space.

### Key Differences from `Row`:
- **Overflow Prevention**: Putting too many items in a `Row` throws a yellow/black stripe overflow error. `Wrap` wraps them onto the next line.
- **Direction**: Supports both horizontal and vertical wrapping flows.
- **Best Use Case**: Displaying category tags, list chips, filter filters, or social interest buttons where card sizes vary.

---

## 3. `MediaQuery` in Flutter

`MediaQuery` provides details about the current device's screen constraints, orientations, and accessibility settings.

### How it helps build responsive layouts:
- **Fetch Dimensions**: You can get the exact viewport width and height:
  ```dart
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  ```
- **Conditional Layouts**: You can choose layout grids based on width:
  ```dart
  bool isTablet = MediaQuery.of(context).size.width >= 600;
  return isTablet ? const TabletLayout() : const MobileLayout();
  ```
- **Orientation checks**: Detects if the device is in portrait or landscape mode, allowing you to adapt columns.

---

## 4. The `SafeArea` Widget

`SafeArea` is a padding wrapper widget that automatically adds necessary margins to its child to avoid overlapping with system UI intrusions.

### Why it matters for modern phones:
- **Intrusion Protection**: Modern phones have notches, camera cutouts (dynamic islands), status bars (battery, time indicators), and bottom home gesture lines.
- **Prevent Clipped Content**: If you don't use `SafeArea`, an `AppBar` or body text might render directly behind the system status clock or be cut off by a screen notch. `SafeArea` queries the OS and adds padding to ensure all content stays within the safe drawing bounds.

---

## 5. State Management using the `Provider` Package

[`provider`](https://pub.dev/packages/provider) is a wrapper around `InheritedWidget` that makes state sharing and state management simple and highly scalable.

### How it shares state across screens:
1. **Centralized Data Model**: You define a model that extends `ChangeNotifier` to hold the app state:
   ```dart
   class TaskModel extends ChangeNotifier {
     List<String> tasks = [];
     void addTask(String task) {
       tasks.add(task);
       notifyListeners(); // rebuilds listening widgets
     }
   }
   ```
2. **Provide State at Root**: Wrap the root app in a `ChangeNotifierProvider` so the model is accessible to all child screens.
3. **Consume State on Any Screen**: Any screen can read or write to this model using `context.watch<TaskModel>()` or `Provider.of<TaskModel>(context)`. When data updates, only the widgets reading the data rebuild automatically, avoiding manual data passing between screen constructors.
