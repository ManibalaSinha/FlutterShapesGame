import 'package:flutter/material.dart';

class ABCScreen extends StatelessWidget {
  const ABCScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ABC')),
      body: const Center(
        child: Text('ABC Content Here', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
