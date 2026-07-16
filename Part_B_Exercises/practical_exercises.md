# Part B — Practical Exercises

This document details the code listings and layout strategies for the five practical exercises under Part B of the Day 10 assignment. All exercises are fully implemented in the unified dashboard application:
[student_management_app/lib/main.dart](file:///C:/Users/koushik/.gemini/antigravity-ide/scratch/day10-assignment/student_management_app/lib/main.dart)

---

## 1. Row containing three widgets with varying mainAxisAlignment values

This exercise shows how to align three widgets (a star icon, text description, and checked icon) horizontally across the main axis.

### Code Block:
```dart
class RowAlignmentScreen extends StatelessWidget {
  const RowAlignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row Alignment Demo')),
      body: Column(
        children: [
          const Text('Row Alignment: MainAxisAlignment.spaceBetween'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(Icons.star, color: Colors.amber),
              Text('Center Item'),
              Icon(Icons.check_circle, color: Colors.green),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Row Alignment: MainAxisAlignment.spaceEvenly'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.star, color: Colors.amber),
              Text('Center Item'),
              Icon(Icons.check_circle, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
```

---

## 2. Column layout using Expanded to fill remaining space

This exercise demonstrates vertical linear layout, placing a fixed-height header and footer box on the screen, and letting the middle container fill all remaining space using the `Expanded` widget.

### Code Block:
```dart
class ColumnExpandedScreen extends StatelessWidget {
  const ColumnExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(height: 80, color: Colors.red, child: const Center(child: Text('Fixed Header'))),
          Expanded(
            child: Container(
              color: Colors.blue.shade100,
              child: const Center(child: Text('Expanded (Fills Remaining Space)')),
            ),
          ),
          Container(height: 60, color: Colors.green, child: const Center(child: Text('Fixed Footer'))),
        ],
      ),
    );
  }
}
```

---

## 3. Stack containing a base Container and a Positioned badge in the corner

This exercise demonstrates Z-axis overlapping layouts. A 140x140px base card is drawn, and a "HOT" badge is placed exactly 10px from the top and right edges using the `Positioned` widget.

### Code Block:
```dart
class StackBadgeScreen extends StatelessWidget {
  const StackBadgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 140, height: 140,
            decoration: BoxDecoration(
              color: Colors.indigo.shade100,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.indigo),
            ),
            child: const Center(child: Text('Base Card')),
          ),
          Positioned(
            top: -10, right: -10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Text('HOT', style: TextStyle(color: Colors.white, fontSize: 10)),
            ),
          ),
        ],
      ),
    );
  }
}
```

---

## 4. ListView.builder displaying a list of 10 items from data

This exercise demonstrates dynamic, lazy list building. It takes an array of 10 text strings and renders them inside custom cards as the user scrolls, allocating memory efficiently.

### Code Block:
```dart
class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => 'List Item Number ${index + 1}');

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text(items[index]),
          ),
        );
      },
    );
  }
}
```

---

## 5. GridView.count with 2 columns of colored containers

This exercise demonstrates two-dimensional scrollable layouts. It creates a grid structure with a fixed cross-axis count of 2 columns, rendering colored container tiles with customized gaps.

### Code Block:
```dart
class GridViewCountScreen extends StatelessWidget {
  const GridViewCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: List.generate(6, (index) {
        return Container(
          color: Colors.indigo.shade100,
          child: Center(child: Text('Box ${index + 1}')),
        );
      }),
    );
  }
}
```
