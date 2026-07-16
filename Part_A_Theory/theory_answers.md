# Part A — Theory Questions: UI Components & Navigation in Flutter

---

### 1. Explain what a user interface is and how Flutter builds it.

A **User Interface (UI)** is the visual and interactive surface of an application. It encompasses everything the user sees and interacts with — screens, text, buttons, images, form inputs, scrolling lists, and structural layouts.

**How Flutter builds UIs**:
- Flutter builds UIs entirely using **widgets** composed into a hierarchical **Widget Tree**.
- It uses a **declarative programming model** where the UI is a function of the current state: `UI = f(State)`. Instead of imperatively searching and modifying UI elements (like `document.getElementById` in web JS), you describe what the UI should look like for a given state, and Flutter updates the screen when the state changes.
- Unlike other frameworks that act as wrappers around platform-native widgets (like React Native) or run within a web browser control (like Cordova), Flutter compiles directly to native ARM machine code and draws its own pixels using a high-performance rendering engine (**Impeller** or **Skia**). The engine communicates with the screen surface, drawing every component from scratch for maximum performance and consistency.

---

### 2. Explain widget composition and why it matters.

**Widget composition** is the design pattern of building complex user interfaces by combining many small, simple, and single-purpose widgets together rather than extending large, monolithic classes. This follows the software design principle **"composition over inheritance."**

**Why it matters**:
- **Reusability**: Small, modular widgets (like a custom button or card) can be reused across different screens, adhering to the DRY (Don't Repeat Yourself) principle.
- **Maintainability**: Smaller widgets have a single responsibility, making bugs easier to locate, isolate, and fix.
- **Readability**: Breaking a deep, nested widget tree into separate class components (e.g. `StudentCard()`, `SettingsRow()`) makes the codebase highly readable.
- **Performance**: Flutter can optimize rendering by rebuilding only specific sub-branches of the widget tree that have changed, rather than rebuilding the entire screen.

---

### 3. Explain the difference between Row and Column, including their axes.

`Row` and `Column` are the primary layout widgets in Flutter used to arrange children linearly. Their behaviors are identical, but their directional axes are flipped:

| Layout Widget | Direction | Main Axis | Cross Axis |
|---|---|---|---|
| **`Row`** | Horizontal | **Horizontal** (Left → Right) | **Vertical** (Top → Bottom) |
| **`Column`** | Vertical | **Vertical** (Top → Bottom) | **Horizontal** (Left → Right) |

- **`mainAxisAlignment`**: Controls how children are spaced and aligned along the **Main Axis** (e.g. `start`, `end`, `center`, `spaceBetween`, `spaceAround`, `spaceEvenly`).
- **`crossAxisAlignment`**: Controls how children are aligned along the perpendicular **Cross Axis** (e.g. `start`, `end`, `center`, `stretch`).

---

### 4. Explain Expanded and Flexible and what they do.

Inside a `Row` or `Column`, children by default take only as much space as their content requires. `Expanded` and `Flexible` are used to control how children resize and share the remaining available space:

- **`Expanded`**:
  - Forces its child to **fill all the remaining available space** along the main axis of the parent `Row` or `Column`.
  - Under the hood, it is shorthand for `Flexible(fit: FlexFit.tight)`.
  - If multiple children are wrapped in `Expanded`, they share the remaining space proportionally based on their `flex` factor integer (default is `1`).
- **`Flexible`**:
  - Allows its child to occupy a share of the remaining space, but **only up to what the child needs**. It does not force the child to fill the space.
  - Under the hood, it defaults to `fit: FlexFit.loose`.
  - Useful when wrapping wrapping text components to prevent overflow errors while allowing them to shrink if space is constrained.

---

### 5. Explain the Stack widget and when to use it.

While `Row` and `Column` lay out children side-by-side, the **`Stack`** widget layers widgets **on top of each other** along the Z-axis (overlapping in the same space).

- **How it works**: Children are painted in the order they are declared in the `children` list. The first item is at the bottom, and the last item is rendered on the very top.
- **`Positioned` Widget**: You can wrap children of a `Stack` in a `Positioned` widget to place them at absolute coordinates (using `top`, `bottom`, `left`, `right`) relative to the Stack's boundaries, matching CSS absolute positioning.
- **When to use it**:
  - Overlaying text or badges on top of an image.
  - Adding notification count circles to the corner of an icon.
  - Creating custom avatar screens with a floating camera/edit badge in the corner.
  - Layering custom background gradients under content card containers.

---

### 6. Explain the difference between `ListView` and `ListView.builder`.

Both are scrollable lists, but they handle memory allocation and item creation differently:

- **`ListView(children: [...])`**:
  - **Static Allocation**: Instantiates and builds **all children at once**, even those currently off-screen.
  - **Best For**: Small, fixed lists (e.g., settings panels, form fields, lists under 20 items).
  - **Performance**: High memory usage for long lists; can cause frame drops.
- **`ListView.builder(itemBuilder: ...)`**:
  - **Dynamic/Lazy Allocation**: Instantiates and builds items **on-demand** (only when they are about to scroll onto the screen) and recycles memory when they scroll off-screen.
  - **Best For**: Long, infinite, or dynamically fetched lists (e.g., database records, social media feeds).
  - **Performance**: High efficiency; low memory footprint.

---

### 7. Explain the navigation stack with push and pop.

Flutter manages multi-screen interfaces using a **Navigation Stack** (a LIFO - Last In, First Out stack of screen representations called **Routes**):

- **Push (`Navigator.push`)**:
  - Adds a new screen route to the **top** of the stack. The new screen slides onto the screen, overlaying and hiding the previous screen. The previous screen remains suspended underneath in the stack memory.
- **Pop (`Navigator.pop`)**:
  - Removes the current active screen route from the **top** of the stack. The screen is destroyed, sliding out to reveal the screen immediately below it.
- **AppBar Auto-Back Button**:
  - If a screen is pushed onto a stack that has a screen beneath it, the default `AppBar` automatically renders a back arrow icon that triggers `Navigator.pop(context)` on tap.

---

### 8. Explain how to pass data between screens.

In Flutter, data can be passed between screens in two primary directions:

#### A. Passing Data Forward (During Push)
- **Constructor Approach (Most Common)**:
  Pass data directly into the destination screen's constructor parameters when creating it:
  ```dart
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailsScreen(studentName: 'Priya Sharma'),
    ),
  );
  ```
- **Arguments Approach (Named Routes)**:
  Pass data inside the `arguments` parameter of `pushNamed` and retrieve it in the target build method using `ModalRoute`:
  ```dart
  // Send
  Navigator.pushNamed(context, '/details', arguments: 'Priya');
  // Retrieve
  final name = ModalRoute.of(context)!.settings.arguments as String;
  ```

#### B. Passing Data Backward (During Pop)
A route can return a value when popped, which is captured by `awaiting` the initial `push` call:
```dart
// Destination Screen: Pop with data
Navigator.pop(context, 'Success');

// Origin Screen: Await push result
final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => FormScreen()));
print(result); // 'Success'
```

---

### 9. Explain named routes and their advantages.

**Named Routes** is a navigation approach where screens are registered with unique string paths (similar to website URLs) in a centralized registry map inside the root `MaterialApp` widget.

```dart
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const HomeScreen(),
    '/list': (context) => const ListScreen(),
    '/settings': (context) => const SettingsScreen(),
  },
);
```

**Advantages**:
1. **Centralized Configuration**: All screen routes are declared in one file (`main.dart`), making the app skeleton easy to read.
2. **Cleaner Navigation Calls**: You navigate using short strings (e.g., `Navigator.pushNamed(context, '/settings')`) instead of nesting verbose `MaterialPageRoute` builders everywhere.
3. **Decoupled Architecture**: Screens do not need to import each other to establish link connections, reducing codebase coupling.
4. **Scalable Routing**: Simplifies deep-linking and integration with advanced routers (like `go_router`).

---

### 10. Explain how today's concepts relate to web development (Flexbox, the box model, the DOM).

Flutter's layout system builds directly on web development standards, allowing concepts to map 1-to-1:

| Flutter Concept | Web/CSS Equivalent | Core Parallel |
|---|---|---|
| **Widget Tree** | **DOM (Document Object Model)** | Both are hierarchical structures where parents contain children, determining layout coordinates. |
| **`Row` / `Column`** | **Flexbox (`display: flex`)** | `Row` is `flex-direction: row`. `Column` is `flex-direction: column`. |
| **`mainAxisAlignment`** | **`justify-content`** | Arranges items along the primary flow axis. |
| **`crossAxisAlignment`**| **`align-items`** | Arranges items along the perpendicular axis. |
| **`Expanded`** | **`flex-grow: 1`** | Forces an element to expand and occupy remaining space. |
| **`Container`** | **Styled `<div>` Box Model** | Implements the CSS box model: has `padding` (inner space), `margin` (outer space), `border`, `borderRadius` (`border-radius`), and `boxShadow` (`box-shadow`). |
| **`BoxFit.cover`** | **`object-fit: cover`** | Scales an image to fill its bounding box while cropping overflow without distortion. |
| **Named Routes** | **URL Paths** | Mapping screens to paths like `/profile` matches web site navigation routing. |
