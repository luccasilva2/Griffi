import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opção de produtos e imagens de exemplo'),
      ),
      body: Center(
        child: Text(
          'Opção de produtos e imagens de exemplo',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}
