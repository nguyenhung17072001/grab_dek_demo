import 'package:flutter/material.dart';
import 'package:grab_dek_demo/screens/host_screen.dart';


class BottomTab extends StatefulWidget {
  const BottomTab({super.key});

  @override
  State<BottomTab> createState() => _BottomTabState();
}

class _BottomTabState extends State<BottomTab> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    
    const HostScreen(),
    Container(
      child: const Center(
        child: Text('Tab 2'),
      ),
    ),
    Container(
      child: const Center(
        child: Text('Tab 3'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Chủ nhà',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Thợ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Tab 3',
          ),
        ],
      ),
    );
  }
}
