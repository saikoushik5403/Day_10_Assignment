import 'package:flutter/material.dart';

void main() {
  runApp(const MasterApp());
}

class MasterApp extends StatelessWidget {
  const MasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Day 10 Assignment Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const DashboardHubScreen(),
        '/settings': (context) => const SettingsChallengeScreen(),
        '/profile': (context) => const ProfileChallengeScreen(),
        '/login': (context) => const LoginChallengeScreen(),
        '/products': (context) => const ProductGridChallengeScreen(),
      },
    );
  }
}

// =========================================================================
// 🏢 MASTER HUB SCREEN
// =========================================================================
class DashboardHubScreen extends StatelessWidget {
  const DashboardHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Day 10 Assignment Hub'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.indigo),
              child: Text(
                'Day 10 Labs',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.school),
              title: const Text('Student Management App'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentManagementHomeScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.task),
              title: const Text('Student Task Manager (Day 8 Plan)'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentTaskManagerScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.restaurant_menu),
              title: const Text('Recipe Search App'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RecipeAppScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.contacts),
              title: const Text('Contacts App'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactsAppScreen()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.folder_shared),
              title: const Text('Multi-Screen Portfolio App'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PortfolioHomeScreen()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Welcoming Banner
            Card(
              color: Colors.indigo.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: Border.all(color: Colors.indigo.shade100),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.dashboard, size: 48, color: Colors.indigo.shade700),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome, Sai Koushik', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.indigo.shade900)),
                          const Text('Click any module below to launch the respective Day 10 lab.', style: TextStyle(fontSize: 13, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // MODULE B: PRACTICAL EXERCISES
            buildSectionHeader('Part B: Practical Exercises'),
            const SizedBox(height: 8),
            buildModuleGrid(context, [
              ModuleItem('Row Alignment', Icons.view_column, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RowAlignmentScreen()))),
              ModuleItem('Column Expanded', Icons.view_headline, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ColumnExpandedScreen()))),
              ModuleItem('Stack & Badge', Icons.layers, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const StackBadgeScreen()))),
              ModuleItem('ListView.builder', Icons.list, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ListViewBuilderScreen()))),
              ModuleItem('GridView.count', Icons.grid_on, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const GridViewCountScreen()))),
            ]),
            const SizedBox(height: 24),

            // MODULE C: UI CHALLENGES
            buildSectionHeader('Part C: UI Challenges'),
            const SizedBox(height: 8),
            buildModuleGrid(context, [
              ModuleItem('Profile Card', Icons.card_membership, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileCardScreen()))),
              ModuleItem('Login Form', Icons.login, () => Navigator.pushNamed(context, '/login')),
              ModuleItem('Settings List', Icons.settings, () => Navigator.pushNamed(context, '/settings')),
              ModuleItem('Product Grid', Icons.shopping_bag, () => Navigator.pushNamed(context, '/products')),
            ]),
            const SizedBox(height: 24),

            // MODULE D: NAVIGATION CHALLENGES
            buildSectionHeader('Part D: Navigation Challenges'),
            const SizedBox(height: 8),
            buildModuleGrid(context, [
              ModuleItem('Direct Push/Pop', Icons.swap_horiz, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TwoScreenNavigationA()))),
              ModuleItem('Named Routes', Icons.route, () => Navigator.pushNamed(context, '/settings')),
              ModuleItem('Data Passing', Icons.send, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DataPassingSourceScreen()))),
              ModuleItem('Return Result', Icons.replay, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ReturnValueSourceScreen()))),
            ]),
            const SizedBox(height: 24),

            // MODULE E: MINI PROJECTS
            buildSectionHeader('Part E: Mini Projects'),
            const SizedBox(height: 8),
            buildModuleGrid(context, [
              ModuleItem('Student Manager ⭐', Icons.school, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentManagementHomeScreen()))),
              ModuleItem('Recipe App', Icons.restaurant_menu, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RecipeAppScreen()))),
              ModuleItem('Contacts App', Icons.contacts, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactsAppScreen()))),
              ModuleItem('Portfolio App', Icons.folder_shared, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PortfolioHomeScreen()))),
              ModuleItem('Task Manager', Icons.task, () => Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentTaskManagerScreen()))),
            ]),
          ],
        ),
      ),
    );
  }

  Widget buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
    );
  }

  Widget buildModuleGrid(BuildContext context, List<ModuleItem> items) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.2,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          elevation: 1.5,
          child: InkWell(
            onTap: item.onTap,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Row(
                children: [
                  Icon(item.icon, color: Colors.indigo.shade600, size: 24),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.title,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class ModuleItem {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  ModuleItem(this.title, this.icon, this.onTap);
}

// =========================================================================
// PART B: EXERCISE SCREENS
// =========================================================================

// --- B1: Row Alignment ---
class RowAlignmentScreen extends StatelessWidget {
  const RowAlignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Row Alignment Demo'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Row Alignment: MainAxisAlignment.spaceBetween', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text('Center Item'),
                  Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text('Row Alignment: MainAxisAlignment.spaceEvenly', style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              color: Colors.grey.shade200,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.star, color: Colors.amber),
                  Text('Center Item'),
                  Icon(Icons.check_circle, color: Colors.green),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- B2: Column Expanded ---
class ColumnExpandedScreen extends StatelessWidget {
  const ColumnExpandedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Column Expanded Demo'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Column(
        children: [
          Container(height: 80, color: Colors.red, child: const Center(child: Text('Fixed Height (80px)', style: TextStyle(color: Colors.white)))),
          Expanded(
            child: Container(
              color: Colors.blue.shade100,
              child: const Center(child: Text('Expanded Section (Fills remaining height)', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            ),
          ),
          Container(height: 60, color: Colors.green, child: const Center(child: Text('Fixed Height (60px)', style: TextStyle(color: Colors.white)))),
        ],
      ),
    );
  }
}

// --- B3: Stack & Badge ---
class StackBadgeScreen extends StatelessWidget {
  const StackBadgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack & Positioned Badge'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Background Container
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: Colors.indigo.shade100,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.indigo),
              ),
              child: const Center(child: Text('Base Card', style: TextStyle(fontWeight: FontWeight.bold))),
            ),
            // Positioned Badge in the corner
            Positioned(
              top: -10,
              right: -10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const Text(
                  'HOT',
                  style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- B4: ListView.builder ---
class ListViewBuilderScreen extends StatelessWidget {
  const ListViewBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> items = List.generate(10, (index) => 'List Item Number ${index + 1}');

    return Scaffold(
      appBar: AppBar(title: const Text('ListView.builder'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(items[index]),
              subtitle: const Text('Rendered lazily on-demand'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            ),
          );
        },
      ),
    );
  }
}

// --- B5: GridView.count ---
class GridViewCountScreen extends StatelessWidget {
  const GridViewCountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Color> colors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.teal];

    return Scaffold(
      appBar: AppBar(title: const Text('GridView.count'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: List.generate(colors.length, (index) {
          return Container(
            decoration: BoxDecoration(
              color: colors[index].withOpacity(0.15),
              border: Border.all(color: colors[index], width: 1.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                'Box ${index + 1}',
                style: TextStyle(color: colors[index], fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// =========================================================================
// PART C: UI CHALLENGES SCREENS
// =========================================================================

// --- C1: Profile Card Screen ---
class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Card Challenge'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
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
                        const Row(
                          children: [
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
          ),
        ),
      ),
    );
  }
}

// --- C2: Login Form Screen ---
class LoginChallengeScreen extends StatefulWidget {
  const LoginChallengeScreen({super.key});

  @override
  State<LoginChallengeScreen> createState() => _LoginChallengeScreenState();
}

class _LoginChallengeScreenState extends State<LoginChallengeScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Challenge'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.lock_person, size: 64, color: Colors.indigo),
            const SizedBox(height: 24),
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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Logged in successfully: $email')),
                );
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo, foregroundColor: Colors.white, padding: const EdgeInsets.symmetric(vertical: 14)),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- C3: Settings Screen ---
class SettingsChallengeScreen extends StatelessWidget {
  const SettingsChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings Challenge'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.notifications, color: Colors.indigo),
            title: const Text('Push Notifications'),
            subtitle: const Text('Manage app notifications settings'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.shield_auth, color: Colors.indigo),
            title: const Text('Privacy & Security'),
            subtitle: const Text('Password, Biometric logins'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {},
          ),
          const Divider(height: 1),
          ListTile(
            leading: const Icon(Icons.palette, color: Colors.indigo),
            title: const Text('App Theme'),
            subtitle: const Text('Light mode / Dark mode toggles'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

// --- C4: Product Grid Screen ---
class ProductGridChallengeScreen extends StatelessWidget {
  const ProductGridChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {'name': 'Developer Laptop', 'price': '₹85,000'},
      {'name': 'Mechanical Keyboard', 'price': '₹6,500'},
      {'name': 'Wireless Mouse', 'price': '₹3,200'},
      {'name': 'Noise Cancelling Headset', 'price': '₹12,000'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Product Grid Challenge'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.85,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final prod = products[index];
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Image placeholder
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
                    ),
                    child: const Icon(Icons.image, size: 48, color: Colors.grey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(prod['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13), maxLines: 1, overflow: TextOverflow.ellipsis),
                      const SizedBox(height: 2),
                      Text(prod['price']!, style: const TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold, fontSize: 12)),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

// =========================================================================
// PART D: NAVIGATION CHALLENGES SCREENS
// =========================================================================

// --- D1: Two Screen Navigation (Direct Push/Pop) ---
class TwoScreenNavigationA extends StatelessWidget {
  const TwoScreenNavigationA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Screen A'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const TwoScreenNavigationB()));
          },
          child: const Text('Push Screen B →'),
        ),
      ),
    );
  }
}

class TwoScreenNavigationB extends StatelessWidget {
  const TwoScreenNavigationB({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Navigation Screen B'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('← Pop Back to A'),
        ),
      ),
    );
  }
}

// --- D3: Data Passing Screen ---
class DataPassingSourceScreen extends StatelessWidget {
  const DataPassingSourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Passing Source'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DataPassingDestinationScreen(dataValue: 'Secret Token Code 123')),
                );
              },
              child: const Text('Pass Data via Constructor'),
            ),
          ],
        ),
      ),
    );
  }
}

class DataPassingDestinationScreen extends StatelessWidget {
  final String dataValue;
  const DataPassingDestinationScreen({super.key, required this.dataValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Passing Destination'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Data Received:', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 8),
            Text(dataValue, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigo)),
          ],
        ),
      ),
    );
  }
}

// --- D5: Return Value Screen ---
class ReturnValueSourceScreen extends StatefulWidget {
  const ReturnValueSourceScreen({super.key});

  @override
  State<ReturnValueSourceScreen> createState() => _ReturnValueSourceScreenState();
}

class _ReturnValueSourceScreenState extends State<ReturnValueSourceScreen> {
  String returnedMessage = 'No message returned yet.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Awaiting Return Value'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(returnedMessage, style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic)),
            const SizedBox(height: 24),
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
            ),
          ],
        ),
      ),
    );
  }
}

class ReturnValueDestinationScreen extends StatelessWidget {
  const ReturnValueDestinationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Return Value Destination'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Success Status Code 200'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green, foregroundColor: Colors.white),
              child: const Text('Pop Back with Success'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 'Failed Status Code 500'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
              child: const Text('Pop Back with Failure'),
            ),
          ],
        ),
      ),
    );
  }
}

// =========================================================================
// PART E: MINI PROJECTS
// =========================================================================

// --- E1: Student Management Capstone App ---
class StudentManagementHomeScreen extends StatelessWidget {
  const StudentManagementHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.school, size: 80, color: Colors.indigo),
            const SizedBox(height: 16),
            const Text(
              'Student Database System',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.people),
              label: const Text('View Student Records'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentListScreen()));
              },
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(16)),
            ),
          ],
        ),
      ),
    );
  }
}

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> students = [
      {'name': 'Priya Sharma', 'course': 'Computer Science', 'year': '2nd Year'},
      {'name': 'Arjun Reddy', 'course': 'Electronics', 'year': '1st Year'},
      {'name': 'Sara Khan', 'course': 'Mechanical Eng.', 'year': '3rd Year'},
      {'name': 'Ravi Kumar', 'course': 'Civil Engineering', 'year': '2nd Year'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Students list'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final std = students[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.indigo,
                child: Text(std['name']![0], style: const TextStyle(color: Colors.white)),
              ),
              title: Text(std['name']!),
              subtitle: Text(std['course']!),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentDetailsScreen(student: std)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class StudentDetailsScreen extends StatelessWidget {
  final Map<String, String> student;
  const StudentDetailsScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Details'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo.shade100,
              child: Text(student['name']![0], style: const TextStyle(fontSize: 40, color: Colors.indigo, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16),
            Text(student['name']!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            buildDetailCard(Icons.book, 'Course Enrolled', student['course']!),
            buildDetailCard(Icons.calendar_today, 'Academic Year', student['year']!),
          ],
        ),
      ),
    );
  }

  Widget buildDetailCard(IconData icon, String label, String value) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(icon, color: Colors.indigo),
        title: Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        subtitle: Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}

// --- E2: Recipe App Screen ---
class RecipeAppScreen extends StatelessWidget {
  const RecipeAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> recipes = [
      {'title': 'Classic Hyderabadi Biryani', 'time': '60 min', 'details': 'Basmati rice, chicken, spices.'},
      {'title': 'Paneer Tikka Masala', 'time': '35 min', 'details': 'Grilled paneer cubes in tomato gravy.'},
      {'title': 'Dosa & Sambar', 'time': '20 min', 'details': 'Crispy rice crêpe served with lentil soup.'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Recipes'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          final recipe = recipes[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.restaurant, color: Colors.orange),
              title: Text(recipe['title']!),
              subtitle: Text('Preparation time: ${recipe['time']}'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RecipeDetailsScreen(recipe: recipe)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class RecipeDetailsScreen extends StatelessWidget {
  final Map<String, String> recipe;
  const RecipeDetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe['title']!), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.dinner_dining, size: 64, color: Colors.orange),
            const SizedBox(height: 16),
            Text(recipe['title']!, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text('Prep Time: ${recipe['time']}', style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            const Text('Ingredients & Summary:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(recipe['details']!, style: const TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

// --- E3: Contacts App Screen ---
class ContactsAppScreen extends StatelessWidget {
  const ContactsAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> contacts = [
      {'name': 'Sai Koushik', 'phone': '+91 98765 43210'},
      {'name': 'Amita Sharma', 'phone': '+91 91234 56789'},
      {'name': 'Rohit Verma', 'phone': '+91 87654 32109'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Contacts'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final c = contacts[index];
          return ListTile(
            leading: CircleAvatar(child: Text(c['name']![0])),
            title: Text(c['name']!),
            subtitle: Text(c['phone']!),
            trailing: const Icon(Icons.phone, color: Colors.green),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(title: Text(c['name']!), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
                    body: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.account_circle, size: 80, color: Colors.indigo),
                          const SizedBox(height: 16),
                          Text(c['name']!, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Text('Mobile: ${c['phone']!}', style: const TextStyle(fontSize: 18, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// --- E4: Multi-Screen Portfolio App ---
class PortfolioHomeScreen extends StatelessWidget {
  const PortfolioHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Portfolio'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 16),
            const Text('Sai Koushik', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: const Text('My Projects'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
                      body: ListView(
                        children: const [
                          ListTile(leading: Icon(Icons.web), title: Text('Personal Website'), subtitle: Text('HTML & CSS portfolio')),
                          ListTile(leading: Icon(Icons.mobile_friendly), title: Text('To-Do List Flutter App'), subtitle: Text('Interactive task manager')),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: const Text('View Projects'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(title: const Text('Contact Details'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
                      body: const Center(
                        child: Text('Email: saikoushik5403@gmail.com', style: TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Contact Me'),
            ),
          ],
        ),
      ),
    );
  }
}

// --- E5: Student Task Manager Screen (Day 8 Plan) ---
class StudentTaskManagerScreen extends StatefulWidget {
  const StudentTaskManagerScreen({super.key});

  @override
  State<StudentTaskManagerScreen> createState() => _StudentTaskManagerScreenState();
}

class _StudentTaskManagerScreenState extends State<StudentTaskManagerScreen> {
  final List<String> tasks = ['Submit Day 9 Assignment', 'Prepare Day 10 Codebase', 'Research state management'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Student Task Manager'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.check_box_outline_blank, color: Colors.indigo),
              title: Text(tasks[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    tasks.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            tasks.add('New Task Added at ${DateTime.now().minute}m');
          });
        },
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}

// --- F1: Profile Page Placeholder ---
class ProfileChallengeScreen extends StatelessWidget {
  const ProfileChallengeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen'), backgroundColor: Colors.indigo, foregroundColor: Colors.white),
      body: const Center(
        child: Text('My Profile Screen Details'),
      ),
    );
  }
}
