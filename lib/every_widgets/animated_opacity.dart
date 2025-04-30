import 'package:flutter/material.dart';

class Widget014 extends StatefulWidget {
  const Widget014({Key? key}) : super(key: key);

  @override
  State<Widget014> createState() => _Widget014State();
}

class _Widget014State extends State<Widget014> {
  double opacityLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Opacity'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 2),
              child: const FlutterLogo(
                size: 100, // Aumenté el tamaño para mejor visualización
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              onPressed: () {
                setState(() {
                  opacityLevel = opacityLevel == 0 ? 1.0 : 0.0;
                });
              },
              child: Text(
                opacityLevel == 0 ? 'Mostrar Logo' : 'Ocultar Logo',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
