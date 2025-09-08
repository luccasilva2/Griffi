import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onStartPressed;

  const HomeScreen({super.key, required this.onStartPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Navigate to home or perform any action on logo tap
              },
              child: Image.asset(
                'assets/images/logo.png',
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: onStartPressed,
              child: const Text('Botao inicial'),
            ),
          ],
        ),
      ),
    );
  }
}
