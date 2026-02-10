import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<bool> _isHovered = [false, false, false, false];

  final List<Widget> _pages = [
    Center(child: Text('Accueil', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    Center(child: Text('Services & Formations', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    Center(child: Text('Équipe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
    Center(child: Text('Contact', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.school,
    Icons.group,
    Icons.contact_mail,
  ];

  final List<String> _labels = [
    'Accueil',
    'Services',
    'Équipe',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_labels[_currentIndex]),
        backgroundColor: Colors.blue,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_icons.length, (index) {
            bool isSelected = _currentIndex == index;
            bool isHovered = _isHovered[index];

            return MouseRegion(
              onEnter: (_) => setState(() => _isHovered[index] = true),
              onExit: (_) => setState(() => _isHovered[index] = false),
              child: GestureDetector(
                onTap: () => setState(() => _currentIndex = index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: EdgeInsets.all(isHovered || isSelected ? 12 : 8),
                  decoration: BoxDecoration(
                    color: isHovered || isSelected ? Colors.blue.shade50 : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: (isHovered || isSelected)
                        ? [BoxShadow(color: Colors.blue.shade100, blurRadius: 8, offset: Offset(0, 3))]
                        : [],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _icons[index],
                        size: isHovered || isSelected ? 32 : 24,
                        color: isSelected ? Colors.blue : Colors.grey[700],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        _labels[index],
                        style: TextStyle(
                          color: isSelected ? Colors.blue : Colors.grey[700],
                          fontWeight: isHovered || isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
