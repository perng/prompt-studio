import 'package:flutter/material.dart';
import 'builder_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  
  final List<Widget> _pages = [
    const BuilderPage(), 
    const Scaffold(body: Center(child: Text('Templates (Coming soon in Phase 2)'))),
    const Scaffold(body: Center(child: Text('Saved (Coming soon in Phase 2)'))),
    const Scaffold(body: Center(child: Text('Learn (Coming soon in Phase 2)'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (idx) => setState(() => _currentIndex = idx),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.build), label: 'Builder'),
          BottomNavigationBarItem(icon: Icon(Icons.style), label: 'Templates'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.school), label: 'Learn'),
        ],
      ),
    );
  }
}
