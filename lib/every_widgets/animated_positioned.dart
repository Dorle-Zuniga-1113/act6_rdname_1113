import 'package:flutter/material.dart';

class Widget017 extends StatefulWidget {
  const Widget017({Key? key}) : super(key: key);

  @override
  State<Widget017> createState() => _Widget017State();
}

class _Widget017State extends State<Widget017> {
  bool selected = false;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Positioned'),
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
              Text(
                'Tap the container to animate',
                style: TextStyle(
                  fontSize: 18,
                  color: _isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 250,
                height: 400,
                child: Stack(
                  children: [
                    AnimatedPositioned(
                      width: selected ? 200.0 : 50.0,
                      height: selected ? 50.0 : 200.0,
                      top: selected ? 50.0 : 150.0,
                      left: 25,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _isDarkMode
                                ? Colors.deepPurpleAccent
                                : Colors.orangeAccent,
                            borderRadius:
                                BorderRadius.circular(selected ? 25 : 10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Center(
                            child: Icon(
                              selected ? Icons.expand_less : Icons.expand_more,
                              size: 30,
                              color: _isDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: Icon(
                  selected ? Icons.swap_vert : Icons.swap_horiz,
                  size: 24,
                ),
                label: Text(
                  selected ? 'Vertical Mode' : 'Horizontal Mode',
                  style: const TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  backgroundColor: _isDarkMode
                      ? Colors.deepPurpleAccent
                      : Colors.orangeAccent,
                  foregroundColor: _isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    selected = !selected;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
