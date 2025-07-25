import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;


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
    if (kIsWeb) return; // Disable TTS on web
    await flutterTts.speak(text);
  }
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playClickSound() async {
  await _audioPlayer.play(AssetSource('assets/audio/correct.mp3'));
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
        child: Column(
          children: [
            Expanded(
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
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
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
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                _playClickSound();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShapeScreen2()),
                );
              },
              icon: Icon(Icons.arrow_forward),
              label: Text("Next"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: Colors.deepPurple,
              ),
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

class ShapeScreen2 extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  void _speak(String text) async {
    if (kIsWeb) return; // Disable TTS on web
    await flutterTts.speak(text);
  }

  Widget shapeButton({required String label, required Widget shape}) {
    return GestureDetector(
      onTap: () => _speak(label),
      child: Column(
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
      appBar: AppBar(title: Text("More Shapes")),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.yellow.shade100, Colors.green.shade100],
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
                label: "Rectangle",
                shape: Container(
                  width: 100,
                  height: 60,
                  color: Colors.teal,
                ),
              ),
              shapeButton(
                label: "Oval",
                shape: Container(
                  width: 100,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              shapeButton(
                label: "Heart",
                shape: Icon(Icons.favorite, size: 100, color: Colors.pink),
              ),
              shapeButton(
                label: "Diamond",
                shape: Transform.rotate(
                  angle: 0.785398, // 45 degrees in radians
                  child: Container(
                    width: 70,
                    height: 70,
                    color: Colors.indigo,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

