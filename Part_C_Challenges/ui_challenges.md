# Part C — UI Challenges

This document lists the code structures and styling choices for the five UI Challenges under Part C of the Day 10 assignment. All challenges are fully implemented in the unified dashboard application:
[student_management_app/lib/main.dart](file:///C:/Users/koushik/.gemini/antigravity-ide/scratch/day10-assignment/student_management_app/lib/main.dart)

---

## 1. Profile Card with an avatar, name, and details using Card, Row, Column, and Expanded

A clean card that nests horizontal layout structures, featuring a circular profile badge on the left, and an expanded vertical details stack on the right to utilize screen boundaries.

### Code Block:
```dart
Card(
  elevation: 4,
  child: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: [
        const CircleAvatar(
          radius: 36,
          backgroundColor: Colors.indigo,
          child: Text('SK', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Sai Koushik', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Computer Science Student', style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
              const SizedBox(height: 4),
              Row(
                children: const [
                  Icon(Icons.location_on, size: 14, color: Colors.indigo),
                  SizedBox(width: 4),
                  Text('Hyderabad, India', style: TextStyle(fontSize: 11)),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  ),
)
```

---

## 2. Login Form UI with two TextFields (email, password) and a submit button

A standard forms interface featuring icon decorations, input borders, and a submit button utilizing controllers to capture user input.

### Code Block:
```dart
TextField(
  controller: _emailController,
  decoration: const InputDecoration(
    labelText: 'Email Address',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.email),
  ),
),
const SizedBox(height: 16),
TextField(
  controller: _passwordController,
  obscureText: true,
  decoration: const InputDecoration(
    labelText: 'Password',
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.lock),
  ),
),
const SizedBox(height: 24),
ElevatedButton(
  onPressed: () {
    final email = _emailController.text;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logged in: $email')));
  },
  child: const Text('Sign In'),
)
```

---

## 3. Settings Screen with a ListView of ListTiles and Dividers

Demonstrates the standard list configuration page pattern in mobile. Uses a `ListView` containing `ListTile` items with leading icons and trailing navigation indicators, divided by subtle horizontal rules.

### Code Block:
```dart
ListView(
  children: [
    ListTile(
      leading: const Icon(Icons.notifications, color: Colors.indigo),
      title: const Text('Push Notifications'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {},
    ),
    const Divider(height: 1),
    ListTile(
      leading: const Icon(Icons.shield_auth, color: Colors.indigo),
      title: const Text('Privacy & Security'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: () {},
    ),
  ],
)
```

---

## 4. Product Grid using GridView with image, name, and price placeholders

Renders a grid of retail cards, each featuring an icon placeholder at the top, and description labels with price tags aligned at the bottom.

### Code Block:
```dart
GridView.builder(
  padding: const EdgeInsets.all(12),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    childAspectRatio: 0.85,
  ),
  itemCount: 4,
  itemBuilder: (context, index) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              color: Colors.indigo.shade50,
              child: const Icon(Icons.image, size: 48, color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Developer Laptop', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('₹85,000', style: TextStyle(color: Colors.indigo)),
              ],
            ),
          )
        ],
      ),
    );
  },
)
```

---

## 5. Screen with AppBar, body, FloatingActionButton, and Drawer

This structure is demonstrated on the **Master Hub Screen** (`DashboardHubScreen`), utilizing the complete `Scaffold` template slots.

- **`appBar`**: Top title bar with menu controls.
- **`drawer`**: Left slide-out navigation bar.
- **`body`**: Grid layouts of the assignment hub.
- **`floatingActionButton`**: Navigational shortcuts.
