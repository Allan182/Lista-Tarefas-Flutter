import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  final String texto;
  VoidCallback onPressed;

  Botoes({super.key, required this.texto, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.grey[400],
      child: Text(texto),
    );
  }
}
