import 'package:hive_flutter/hive_flutter.dart';

class TarefinhaDB {
  // step 5
  // referencia
  final _tarefinhasBox = Hive.box('tarefinhasBox');

  List tarefinhas = [];

  // step 9
  void criarBanco() {
    tarefinhas = [
      ["Cream Cheese", false, "2"],
      ["Uva sem Semente", false, "3"]
    ];
  }

  void carregarDados() {
    tarefinhas = _tarefinhasBox.get('TAREFAS');
  }

  void atualizarDados() {
    _tarefinhasBox.put('TAREFAS', tarefinhas);
  }
}
