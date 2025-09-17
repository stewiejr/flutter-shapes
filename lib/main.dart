import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const ShapesDemoApp());
}

class ShapesDemoApp extends StatelessWidget {
  const ShapesDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shapes Drawing Demo',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const ShapesDemoScreen(),
    );
  }
}

class ShapesDemoScreen extends StatelessWidget {
  const ShapesDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shapes Drawing Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_emotions),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InteractiveEmojiScreen(),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Task 1: Basic Shapes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: CustomPaint(
                painter: BasicShapesPainter(),
                size: const Size(double.infinity, 200),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Task 2: Combined Shapes (Abstract Design)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: CombinedShapesPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Task 3: Styled Shapes',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: CustomPaint(
                painter: StyledShapesPainter(),
                size: const Size(double.infinity, 300),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Task 4: Smiley Face',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 250,
              child: CustomPaint(
                painter: SmileyFacePainter(),
                size: const Size(double.infinity, 250),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const InteractiveEmojiScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.palette),
                label: const Text('Open Interactive Emoji Drawer'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BasicShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final squareOffset = Offset(centerX - 80, centerY);
    final circleOffset = Offset(centerX, centerY);
    final arcOffset = Offset(centerX + 80, centerY);
    final rectOffset = Offset(centerX - 160, centerY);
    final lineStart = Offset(centerX - 200, centerY - 50);
    final lineEnd = Offset(centerX - 140, centerY + 50);
    final ovalOffset = Offset(centerX + 160, centerY);

    // Square
    final squarePaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(center: squareOffset, width: 60, height: 60),
      squarePaint,
    );

    // Circle
    final circlePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(circleOffset, 30, circlePaint);

    // Arc
    final arcPaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;
    canvas.drawArc(
      Rect.fromCenter(center: arcOffset, width: 60, height: 60),
      0,
      2.1,
      false,
      arcPaint,
    );

    // Rectangle
    final rectPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(center: rectOffset, width: 80, height: 40),
      rectPaint,
    );

    // Line
    final linePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 3;
    canvas.drawLine(lineStart, lineEnd, linePaint);

    // Oval
    final ovalPaint = Paint()
      ..color = Colors.teal
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(center: ovalOffset, width: 80, height: 40),
      ovalPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CombinedShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Background gradient
    final backgroundGradient = RadialGradient(
      center: Alignment.center,
      radius: 0.8,
      colors: [Colors.blue.shade100, Colors.white],
    );
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..shader = backgroundGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        ),
    );

    // Sun
    final sunPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX, centerY - 40), 40, sunPaint);

    // Rays
    final rayPaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 3;
    for (int i = 0; i < 8; i++) {
      final angle = i * (pi / 4);
      final dx = cos(angle) * 60;
      final dy = sin(angle) * 60;
      canvas.drawLine(
        Offset(centerX, centerY - 40),
        Offset(centerX + dx, centerY - 40 + dy),
        rayPaint,
      );
    }

    // House
    final housePaint = Paint()
      ..color = Colors.brown
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX, centerY + 40),
        width: 80,
        height: 80,
      ),
      housePaint,
    );

    // Roof
    final roofPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    final roofPath = Path()
      ..moveTo(centerX - 60, centerY)
      ..lineTo(centerX + 60, centerY)
      ..lineTo(centerX, centerY - 60)
      ..close();
    canvas.drawPath(roofPath, roofPaint);

    // Door
    final doorPaint = Paint()
      ..color = Colors.blueGrey
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX, centerY + 60),
        width: 30,
        height: 50,
      ),
      doorPaint,
    );

    // Windows
    final windowPaint = Paint()
      ..color = Colors.blue.shade200
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX - 25, centerY + 20),
        width: 20,
        height: 20,
      ),
      windowPaint,
    );
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(centerX + 25, centerY + 20),
        width: 20,
        height: 20,
      ),
      windowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class StyledShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Gradient rectangle
    final rectGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Colors.red, Colors.blue],
    );
    final rect = Rect.fromCenter(
      center: Offset(centerX, centerY - 100),
      width: 200,
      height: 60,
    );
    canvas.drawRect(
      rect,
      Paint()
        ..shader = rectGradient.createShader(rect)
        ..style = PaintingStyle.fill,
    );

    // Circle with border
    final circlePaint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;
    final circleBorderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    canvas.drawCircle(Offset(centerX - 80, centerY), 40, circlePaint);
    canvas.drawCircle(Offset(centerX - 80, centerY), 40, circleBorderPaint);

    // Transparent oval
    final ovalPaint = Paint()
      ..color = Colors.purple.withOpacity(0.5)
      ..style = PaintingStyle.fill;
    canvas.drawOval(
      Rect.fromCenter(
        center: Offset(centerX + 80, centerY),
        width: 100,
        height: 60,
      ),
      ovalPaint,
    );

    // Dashed line
    final dashPaint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
    final path = Path();
    double startX = centerX - 100;
    const dashLength = 10.0;
    const spaceLength = 5.0;
    while (startX < centerX + 100) {
      path.moveTo(startX, centerY + 80);
      path.lineTo(min(startX + dashLength, centerX + 100), centerY + 80);
      startX += dashLength + spaceLength;
    }
    canvas.drawPath(path, dashPaint);

    // Gradient arc
    final arcGradient = SweepGradient(
      center: Alignment.centerRight,
      startAngle: 0,
      endAngle: pi,
      colors: [Colors.red, Colors.yellow, Colors.green],
    );
    final arcRect = Rect.fromCenter(
      center: Offset(centerX, centerY + 100),
      width: 120,
      height: 120,
    );
    final arcPaint = Paint()
      ..shader = arcGradient.createShader(arcRect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(centerX, centerY + 100),
        width: 100,
        height: 100,
      ),
      0,
      2.5,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class SmileyFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = 80.0;

    // Gradient background
    final backgroundGradient = RadialGradient(
      center: Alignment.center,
      radius: 0.6,
      colors: [Colors.yellow.shade100, Colors.yellow.shade50],
    );
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..shader = backgroundGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        ),
    );

    // Face (outer glow)
    final glowPaint = Paint()
      ..color = Colors.yellow.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    canvas.drawCircle(Offset(centerX, centerY), radius + 10, glowPaint);

    // Face (main)
    final facePaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX, centerY), radius, facePaint);

    // Face border
    final borderPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawCircle(Offset(centerX, centerY), radius, borderPaint);

    // Left eye
    final eyePaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX - 25, centerY - 20), 8, eyePaint);

    // Right eye
    canvas.drawCircle(Offset(centerX + 25, centerY - 20), 8, eyePaint);

    // Eye highlights
    final highlightPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX - 23, centerY - 22), 3, highlightPaint);
    canvas.drawCircle(Offset(centerX + 27, centerY - 22), 3, highlightPaint);

    // Nose (small triangle)
    final nosePaint = Paint()
      ..color = Colors.orange.shade300
      ..style = PaintingStyle.fill;
    final nosePath = Path()
      ..moveTo(centerX, centerY - 5)
      ..lineTo(centerX - 5, centerY + 5)
      ..lineTo(centerX + 5, centerY + 5)
      ..close();
    canvas.drawPath(nosePath, nosePaint);

    // Smile (arc)
    final smilePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(centerX, centerY + 10),
        width: 60,
        height: 40,
      ),
      0,
      pi,
      false,
      smilePaint,
    );

    // Cheek blush
    final blushPaint = Paint()
      ..color = Colors.pink.withOpacity(0.3)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX - 50, centerY + 5), 12, blushPaint);
    canvas.drawCircle(Offset(centerX + 50, centerY + 5), 12, blushPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class InteractiveEmojiScreen extends StatefulWidget {
  const InteractiveEmojiScreen({super.key});

  @override
  State<InteractiveEmojiScreen> createState() => _InteractiveEmojiScreenState();
}

class _InteractiveEmojiScreenState extends State<InteractiveEmojiScreen> {
  String selectedEmoji = 'Smiley';
  final List<String> emojiOptions = ['Smiley', 'Party Face', 'Heart'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Emoji Drawer'),
        backgroundColor: Colors.purple.shade100,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple.shade50, Colors.pink.shade50],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Icon(Icons.palette, color: Colors.purple),
                      const SizedBox(width: 10),
                      const Text(
                        'Choose Emoji: ',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedEmoji,
                          isExpanded: true,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedEmoji = newValue!;
                            });
                          },
                          items: emojiOptions.map<DropdownMenuItem<String>>((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  elevation: 8,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: CustomPaint(
                      painter: _getEmojiPainter(selectedEmoji),
                      size: const Size(double.infinity, double.infinity),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CustomPainter _getEmojiPainter(String emoji) {
    switch (emoji) {
      case 'Party Face':
        return PartyFacePainter();
      case 'Heart':
        return HeartPainter();
      default:
        return SmileyFacePainter();
    }
  }
}

class PartyFacePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = 80.0;

    // Confetti background
    _drawConfetti(canvas, size);

    // Gradient background
    final backgroundGradient = RadialGradient(
      center: Alignment.center,
      radius: 0.6,
      colors: [Colors.purple.shade100, Colors.pink.shade50],
    );
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..shader = backgroundGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        ),
    );

    // Face (outer glow)
    final glowPaint = Paint()
      ..color = Colors.pink.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 15);
    canvas.drawCircle(Offset(centerX, centerY), radius + 15, glowPaint);

    // Face (main)
    final facePaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX, centerY), radius, facePaint);

    // Party hat
    final hatPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;
    final hatPath = Path()
      ..moveTo(centerX - 30, centerY - 60)
      ..lineTo(centerX + 30, centerY - 60)
      ..lineTo(centerX, centerY - 120)
      ..close();
    canvas.drawPath(hatPath, hatPaint);

    // Hat decoration
    final hatDecoPaint = Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;
    for (int i = 0; i < 3; i++) {
      canvas.drawCircle(
        Offset(centerX - 15 + i * 15, centerY - 70 + i * 5),
        4,
        hatDecoPaint,
      );
    }

    // Eyes (star-shaped)
    _drawStar(canvas, Offset(centerX - 25, centerY - 20), 10, Colors.blue);
    _drawStar(canvas, Offset(centerX + 25, centerY - 20), 10, Colors.blue);

    // Open mouth (surprised)
    final mouthPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX, centerY + 20), 15, mouthPaint);

    // Inner mouth
    final innerMouthPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX, centerY + 20), 10, innerMouthPaint);
  }

  void _drawConfetti(Canvas canvas, Size size) {
    final confettiPaint = Paint()..style = PaintingStyle.fill;
    final random = Random(42); // Fixed seed for consistent confetti

    for (int i = 0; i < 20; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final colors = [
        Colors.red,
        Colors.blue,
        Colors.green,
        Colors.yellow,
        Colors.purple,
      ];
      confettiPaint.color = colors[random.nextInt(colors.length)];

      canvas.drawRect(
        Rect.fromCenter(center: Offset(x, y), width: 8, height: 4),
        confettiPaint,
      );
    }
  }

  void _drawStar(Canvas canvas, Offset center, double radius, Color color) {
    final starPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    const numPoints = 5;
    const innerRadius = 4.0;

    for (int i = 0; i < numPoints * 2; i++) {
      final angle = i * pi / numPoints;
      final r = i % 2 == 0 ? radius : innerRadius;
      final x = center.dx + r * cos(angle - pi / 2);
      final y = center.dy + r * sin(angle - pi / 2);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, starPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HeartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Romantic gradient background
    final backgroundGradient = RadialGradient(
      center: Alignment.center,
      radius: 0.8,
      colors: [Colors.pink.shade100, Colors.red.shade50],
    );
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..shader = backgroundGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        ),
    );

    // Floating hearts background
    _drawFloatingHearts(canvas, size);

    // Main heart with gradient
    final heartGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.red.shade300, Colors.red.shade600],
    );

    final heartRect = Rect.fromCenter(
      center: Offset(centerX, centerY),
      width: 200,
      height: 200,
    );
    final heartPaint = Paint()
      ..shader = heartGradient.createShader(heartRect)
      ..style = PaintingStyle.fill;

    _drawHeart(canvas, Offset(centerX, centerY), 80, heartPaint);

    // Heart glow effect
    final glowPaint = Paint()
      ..color = Colors.red.withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);
    _drawHeart(canvas, Offset(centerX, centerY), 90, glowPaint);

    // Heart border
    final borderPaint = Paint()
      ..color = Colors.red.shade800
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    _drawHeart(canvas, Offset(centerX, centerY), 80, borderPaint);

    // Sparkles
    _drawSparkles(canvas, size);
  }

  void _drawHeart(Canvas canvas, Offset center, double size, Paint paint) {
    final path = Path();

    // Heart shape using curves
    path.moveTo(center.dx, center.dy + size * 0.3);

    // Left curve
    path.cubicTo(
      center.dx - size * 0.5,
      center.dy - size * 0.1,
      center.dx - size * 0.5,
      center.dy - size * 0.5,
      center.dx,
      center.dy - size * 0.2,
    );

    // Right curve
    path.cubicTo(
      center.dx + size * 0.5,
      center.dy - size * 0.5,
      center.dx + size * 0.5,
      center.dy - size * 0.1,
      center.dx,
      center.dy + size * 0.3,
    );

    canvas.drawPath(path, paint);
  }

  void _drawFloatingHearts(Canvas canvas, Size size) {
    final random = Random(123); // Fixed seed
    final heartPaint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < 8; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final heartSize = 15 + random.nextDouble() * 10;

      heartPaint.color = Colors.pink.withOpacity(0.6);
      _drawHeart(canvas, Offset(x, y), heartSize, heartPaint);
    }
  }

  void _drawSparkles(Canvas canvas, Size size) {
    final sparklePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final random = Random(456); // Fixed seed
    for (int i = 0; i < 15; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final sparkleSize = 5 + random.nextDouble() * 8;

      // Draw cross-shaped sparkle
      canvas.drawLine(
        Offset(x - sparkleSize, y),
        Offset(x + sparkleSize, y),
        sparklePaint,
      );
      canvas.drawLine(
        Offset(x, y - sparkleSize),
        Offset(x, y + sparkleSize),
        sparklePaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
