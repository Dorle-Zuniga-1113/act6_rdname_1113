import 'package:flutter/material.dart';

class PantallaUno extends StatelessWidget {
  const PantallaUno({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffff88ce),
        title: const Text(
          'Pantalla Inicial',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        // Widget Center añadido aquí
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20), // Padding general
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrado vertical
            children: [
              _buildButton(context, '/pantalla2', 'lista animada'),
              const SizedBox(height: 15),
              _buildButton(context, '/pantalla3', 'barrera modal animada'),
              const SizedBox(height: 15),
              _buildButton(context, '/pantalla4', 'opacidad animada'),
              const SizedBox(height: 15),
              _buildButton(context, '/pantalla5', 'padding animado'),
              const SizedBox(height: 15),
              _buildButton(context, '/pantalla6', 'Pantalla Seis'),
              const SizedBox(height: 15),
              _buildButton(context, '/pantalla7', 'modelo fisico'),
              const SizedBox(height: 15),
              _buildButton(context, '/pantalla8', 'animacion posicionada'),
              const SizedBox(height: 15),
              _buildButton(context, '/pantalla9', 'rotacion animada'),
              const SizedBox(height: 15),
              _buildButton(context, '/pantalla10', 'tamaño animado'),
              const SizedBox(height: 15),
              _buildButton(context, '/pantalla11', 'cambiar animacion'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String route, String text) {
    return SizedBox(
      width: 250, // Ancho un poco mayor para mejor visualización
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16), // Más altura
          shape: RoundedRectangleBorder(
            // Bordes redondeados
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () => Navigator.pushNamed(context, route),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
