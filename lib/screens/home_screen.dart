import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback onStartPressed;

  const HomeScreen({super.key, required this.onStartPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logo do aplicativo'),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: onStartPressed,
          child: const Text('Botao inicial'),
        ),
      ),
    );
  }
}
