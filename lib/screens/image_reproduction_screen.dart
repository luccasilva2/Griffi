import 'package:flutter/material.dart';

class ImageReproductionScreen extends StatelessWidget {
  final bool isAdmin;

  const ImageReproductionScreen({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela inicial do aplicativo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Tela inicial do aplicativo com uma reprodução de imagens aonde o usuario ira poder colocar mais imagens a partir das config do aplicativo por uma função aonde so administradores do aplicativo a partir do email terão acesso a essa parte',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
