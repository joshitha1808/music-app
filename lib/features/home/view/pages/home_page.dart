import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (Value) {
          setState(() {
            selectedIndex = Value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home_filled.png'),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Image.asset('assets/images/library.png'),
            label: 'Library',
          ),
        ],
      ),
    );
  }
}
