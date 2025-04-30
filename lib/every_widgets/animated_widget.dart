import 'dart:math' as math;
import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isAnimating = true;
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Widget Demo'),
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
        color: _isDarkMode ? Colors.grey[900] : Colors.grey[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RotatingSquare(controller: _controller, isDarkMode: _isDarkMode),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(_isAnimating ? Icons.pause : Icons.play_arrow),
                    label: Text(_isAnimating ? 'Pause' : 'Play'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      backgroundColor:
                          _isDarkMode ? Colors.deepPurple : Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isAnimating = !_isAnimating;
                        if (_isAnimating) {
                          _controller.repeat();
                        } else {
                          _controller.stop();
                        }
                      });
                    },
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.speed),
                    label: const Text('Change Speed'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 15),
                      backgroundColor:
                          _isDarkMode ? Colors.deepPurple : Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.duration =
                            _controller.duration == const Duration(seconds: 3)
                                ? const Duration(seconds: 1)
                                : const Duration(seconds: 3);
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                'Current speed: ${_controller.duration?.inSeconds}s/rotation',
                style: TextStyle(
                  fontSize: 16,
                  color: _isDarkMode ? Colors.white70 : Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RotatingSquare extends AnimatedWidget {
  final bool isDarkMode;

  const RotatingSquare({
    Key? key,
    required AnimationController controller,
    required this.isDarkMode,
  }) : super(key: key, listenable: controller);

  Animation<double> get _progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _progress.value * 2.0 * math.pi,
      child: Container(
        width: 150.0,
        height: 150.0,
        decoration: BoxDecoration(
          color: isDarkMode ? Colors.deepPurpleAccent : Colors.green,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
        ),
        child: const Icon(
          Icons.refresh,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
