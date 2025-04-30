import 'package:flutter/material.dart';

class Widget019 extends StatefulWidget {
  const Widget019({Key? key}) : super(key: key);

  @override
  State<Widget019> createState() => _Widget019State();
}

class _Widget019State extends State<Widget019> with TickerProviderStateMixin {
  double _size = 200;
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Size Demo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(_isExpanded ? Icons.compress : Icons.expand),
            onPressed: () {
              setState(() {
                _size = _isExpanded ? 100 : 200;
                _isExpanded = !_isExpanded;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  _size = _isExpanded ? 100 : 200;
                  _isExpanded = !_isExpanded;
                });
              },
              child: AnimatedSize(
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
                alignment: Alignment.center,
                child: Container(
                  width: _size,
                  height: _size,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const FlutterLogo(),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Text(
              _isExpanded
                  ? 'Toca el logo para reducir'
                  : 'Toca el logo para expandir',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(_isExpanded ? Icons.compress : Icons.expand),
              label: Text(_isExpanded ? 'Reducir' : 'Expandir'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  _size = _isExpanded ? 100 : 200;
                  _isExpanded = !_isExpanded;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
