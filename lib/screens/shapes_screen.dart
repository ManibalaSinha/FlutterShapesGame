import 'package:flutter/material.dart';

class ShapesScreen extends StatelessWidget {
  const ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shapes')),
      body: const Center(
        child: Text('Shapes Content Here', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
