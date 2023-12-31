import 'package:flutter/material.dart';
import 'tipo_fornecedor.dart';
import 'package:projeto_tcc/fornecedores/visualizar_fornecedores_screen.dart';

String testeSalvamento = '';

class CadastroFornecedoresScreen extends StatelessWidget {
  @override
  final selectedItem = ValueNotifier('');

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de fornecedores'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informações da equipe:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              TextFormField(
                onChanged: (value) {
                  testeSalvamento = value.toString();
                  //checklist.dataEvento = value;
                },
                decoration: InputDecoration(labelText: 'Fornecedor:'),
              ),

              ValueListenableBuilder(
                  valueListenable: selectedItem,
                  builder: (BuildContext context, String value, _) {
                    return DropdownButton<String>(
                      hint: const Text('Selecione o tipo'),
                      value: (value.isEmpty) ? null : value,
                      onChanged: (escolha) =>
                          selectedItem.value = escolha.toString(),
                      items: tipos
                          .map(
                            (opcao) => DropdownMenuItem(
                              value: opcao,
                              child: Text(opcao),
                            ),
                          )
                          .toList(),
                    );
                    //testeSalvamento = testeSalvamento + selectedItem.toString();
                  }),

              ElevatedButton(
                onPressed: () {
                  fornecedores.add(selectedItem.value + ' ' + testeSalvamento);
                  //listSalvamento.add(selectedItem.value.toString() + 'ESPAÇO' + testeSalvamento.toString());
                  print(fornecedores);
                  Navigator.pushNamed(context, '/menu_fornecedores');
                },
                child: Text('Salvar Fornecedor'),
              ),
//const List<String> list = <String>['Decoração', 'Lembrancinhas', 'Cabine de Fotos', 'Fotógrafo', 'Filmagem', 'Doces ', 'Chocolate em cascata', 'Buffet', 'Coquetel', 'Bolo Fake', 'Bolo Corte'];

//return Center(
            ],
          ),
        ),
      ),
    );
  }
}
