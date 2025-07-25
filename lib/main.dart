import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() => runApp(ShapeLearningApp());

class ShapeLearningApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Shapes',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: ShapeScreen(),
    );
  }
}

class ShapeScreen extends StatefulWidget {
  @override
  _ShapeScreenState createState() => _ShapeScreenState();
}

class _ShapeScreenState extends State<ShapeScreen> {
  final FlutterTts flutterTts = FlutterTts();

  void _speak(String text) async {
    await flutterTts.speak(text);
  }

  Widget shapeButton({required String label, required Widget shape}) {
    return GestureDetector(
      onTap: () => _speak(label),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          shape,
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tap the Shape!")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink.shade100, Colors.blue.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            children: [
              shapeButton(
                label: "Circle",
                shape: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                ),
              ),
              shapeButton(
                label: "Square",
                shape: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                ),
              ),
              shapeButton(
                label: "Triangle",
                shape: CustomPaint(
                  size: Size(100, 100),
                  painter: TrianglePainter(),
                ),
              ),
              shapeButton(
                label: "Star",
                shape: Icon(Icons.star, size: 100, color: Colors.orange),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.green;
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
