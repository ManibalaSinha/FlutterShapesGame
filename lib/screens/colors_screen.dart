import 'package:flutter/material.dart';

class ColorsScreen extends StatelessWidget {
  const ColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Colors')),
      body: const Center(
        child: Text('Colors Content Here', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
