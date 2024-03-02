import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TarefaTile extends StatelessWidget {
  final String nome;
  final bool completa;
  final String quantidade;

  Function(bool?)? onChanged;
  Function(BuildContext?)? onDeletar;

  TarefaTile({
    super.key,
    required this.nome,
    required this.quantidade,
    required this.completa,
    required this.onChanged,
    required this.onDeletar,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDeletar,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
     
        child: Container(
          padding: const EdgeInsets.all(24),
          // ignore: sort_child_properties_last

          // ignore: sort_child_properties_last
          child: Column(
            children: [
              // Checkbox
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: completa, onChanged: onChanged),
                  // Nome da tarefa
                  Text(
                    nome,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      decoration: completa
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Quantidade: $quantidade",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      decoration: completa
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.blue[900], borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
