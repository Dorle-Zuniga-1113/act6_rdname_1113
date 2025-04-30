import 'package:flutter/material.dart';

class Widget018 extends StatefulWidget {
  const Widget018({Key? key}) : super(key: key);

  @override
  State<Widget018> createState() => _Widget018State();
}

class _Widget018State extends State<Widget018> {
  double turns = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Rotation Demo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: AnimatedRotation(
                turns: turns,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: const FlutterLogo(
                  size: 120,
                ),
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.rotate_right),
              label: const Text(
                'Rotate 90°',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.orangeAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                setState(() => turns += 1 / 4);
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Current rotation: ${(turns * 360).toStringAsFixed(0)}°',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
