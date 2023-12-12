import 'package:flutter/material.dart';

class ComidaPagina extends StatelessWidget {
  const ComidaPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comida Page'),
      ),
      body: const Center(
        child: Text('hola.'),
      ),
    );
  }
}
