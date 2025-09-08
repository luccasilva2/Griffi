import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/image_reproduction_screen.dart';
import 'screens/products_screen.dart';
import 'screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isAdmin = false;
  int _currentIndex = 0;

  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    _screens.add(HomeScreen(onStartPressed: () {
      setState(() {
        _currentIndex = 1; // Switch to ImageReproductionScreen after logo screen
      });
    }));
    _screens.add(ImageReproductionScreen(isAdmin: isAdmin));
    _screens.add(const ProductsScreen());
    _screens.add(const SettingsScreen());
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Griffi App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: _currentIndex == 0
            ? null
            : BottomNavigationBar(
                currentIndex: _currentIndex,
                onTap: onTabTapped,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Início',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag),
                    label: 'Produtos',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Configurações',
                  ),
                ],
              ),
      ),
    );
  }
}
