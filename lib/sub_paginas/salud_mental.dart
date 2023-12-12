import 'package:flutter/material.dart';

class SaludMentalPagina extends StatelessWidget {
  const SaludMentalPagina({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salud mental'),
      ),
      body: const Center(
        child: Text('Information about salud mental goes here.'),
      ),
    );
  }
}
