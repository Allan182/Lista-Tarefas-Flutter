import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:listadetarefas/controller/CaixaDialogo.dart';
import 'package:listadetarefas/data/TarefinhaDB.dart';
import 'package:listadetarefas/model/tarefaTile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // step 4 - reference hive box
  final _tarefinhasBox = Hive.box('tarefinhasBox');
  // create a data folder > TarefinhaDB.dart
  // databae - step 7
  TarefinhaDB db = TarefinhaDB();

  //step 10
  @override
  void initState() {
    if (_tarefinhasBox.get('TAREFAS') == null) {
      db.criarBanco();
    } else {
      db.carregarDados();
    }
  }

  final controller = TextEditingController();
  final controller2 = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.tarefinhas[index][1] = !db.tarefinhas[index][1]; // step 8
    });
    // step 11
    db.atualizarDados();
  }

  // Criar tarefa via
  void criarNovaTarefa() {
    showDialog(
        context: context,
        builder: ((context) {
          return CaixaDialogo(
            controller: controller,
            controller2: controller2,
            onCancelar: () => Navigator.of(context).pop(),
            onSalvar: salvarTarefa,
          );
        }));
  }

  void salvarTarefa() {
    setState(() {
      db.tarefinhas.add([
        controller.text,
        false,
        controller2.text,
      ]);
      controller.clear();
      controller2.clear();
    });
    Navigator.of(context).pop();
    // step 11
    db.atualizarDados();
  }

  // step 2
  void removerTarefa(int index) {
    setState(() {
      db.tarefinhas.removeAt(index);
    });
    // step 11
    db.atualizarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Lista de Compras'),
          backgroundColor: Colors.blue[700],
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: db.tarefinhas.length,
            itemBuilder: (context, index) {
              return TarefaTile(
                nome: db.tarefinhas[index][0],
                completa: db.tarefinhas[index][1],
                quantidade: db.tarefinhas[index][2],

                onChanged: (value) => checkBoxChanged(value, index),
                // step 1
                onDeletar: (context) => removerTarefa(index),
              );
            }),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              criarNovaTarefa();
            },
            backgroundColor: Colors.blue[900],
            child: const Icon(Icons.add))); // Scaffold
  }
}
