import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela de configurações do aplicativo'),
      ),
      body: Center(
        child: Text(
          'Tela de configurações do aplicativo',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
