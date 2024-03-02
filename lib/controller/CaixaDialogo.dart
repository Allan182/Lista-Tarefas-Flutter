// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:listadetarefas/model/Botoes.dart';

class CaixaDialogo extends StatelessWidget {
  final controller;
  final controller2;

  VoidCallback onSalvar;
  VoidCallback onCancelar;

  CaixaDialogo(
      {super.key,
      required this.controller,
      required this.onSalvar,
      required this.onCancelar,
      required this.controller2});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[200],
      elevation: 15,
      content: SizedBox(
        height: 180,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Entrada de usuario
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Adicione um item de compra"),
            ),
            TextField(
              controller: controller2,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Adicione a quantidade"),
            ),
            // Salvar e cancelar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // salvar
                Botoes(texto: "Adicionar", onPressed: onSalvar),

                const SizedBox(
                  width: 10,
                ),

                // cancelar
                Botoes(texto: "Cancelar", onPressed: onCancelar),
              ],
            )
          ],
        ),
      ),
    );
  }
}
