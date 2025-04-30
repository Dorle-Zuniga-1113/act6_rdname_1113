import 'package:flutter/material.dart';

class Widget016 extends StatefulWidget {
  const Widget016({Key? key}) : super(key: key);

  @override
  State<Widget016> createState() => _Widget016State();
}

class _Widget016State extends State<Widget016> {
  bool _isFlat = true;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Physical Model'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(_isDarkMode ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },
          ),
        ],
      ),
      body: Container(
        color: _isDarkMode ? Colors.grey[850] : Colors.grey[200],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedPhysicalModel(
                duration: const Duration(milliseconds: 500),
                curve: Curves.fastOutSlowIn,
                elevation: _isFlat ? 0 : 12.0,
                shape: BoxShape.rectangle,
                shadowColor: Colors.black,
                color: _isDarkMode ? Colors.grey[800]! : Colors.white,
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Icon(
                    Icons.android,
                    size: 60,
                    color: _isDarkMode ? Colors.greenAccent : Colors.green,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: Icon(
                  _isFlat ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 24,
                ),
                label: Text(
                  _isFlat ? 'Elevar' : 'Aplanar',
                  style: const TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  backgroundColor:
                      _isDarkMode ? Colors.greenAccent : Colors.green,
                  foregroundColor: _isDarkMode ? Colors.black : Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _isFlat = !_isFlat;
                  });
                },
              ),
              const SizedBox(height: 20),
              Text(
                'Elevación: ${_isFlat ? '0' : '12'}',
                style: TextStyle(
                  fontSize: 16,
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
