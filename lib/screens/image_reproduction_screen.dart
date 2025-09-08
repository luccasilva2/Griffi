import 'package:flutter/material.dart';

class ImageReproductionScreen extends StatefulWidget {
  final bool isAdmin;

  const ImageReproductionScreen({super.key, required this.isAdmin});

  @override
  State<ImageReproductionScreen> createState() => _ImageReproductionScreenState();
}

class _ImageReproductionScreenState extends State<ImageReproductionScreen> {
  final List<String> imageUrls = [
    'assets/images/image1.png',
    'assets/images/image2.png',
    'assets/images/image3.png',
    'assets/images/image4.png',
    'assets/images/image5.png',
  ];

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Start automatic image slider
    Future.delayed(const Duration(seconds: 3), _nextImage);
  }

  void _nextImage() {
    if (!mounted) return;
    setState(() {
      _currentIndex = (_currentIndex + 1) % imageUrls.length;
    });
    Future.delayed(const Duration(seconds: 3), _nextImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela inicial do aplicativo'),
      ),
      body: Center(
        child: Image.asset(
          imageUrls[_currentIndex],
          width: 300,
          height: 200,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
