import 'package:flutter/material.dart';
import 'formulario_transacao_screen.dart';
import '../models/transacao.dart';

class ListaTransacoesScreen extends StatefulWidget {
  const ListaTransacoesScreen({super.key});

  @override
  _ListaTransacoesScreenState createState() => _ListaTransacoesScreenState();
}

class _ListaTransacoesScreenState extends State<ListaTransacoesScreen> {
  final List<Transacao> _transacoes = [];

  void _adicionarTransacao(Transacao transacao) {
    setState(() {
      _transacoes.add(transacao);
    });
  }

  void _navegarParaFormulario() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FormularioTransacaoScreen(
            onAdicionarTransacao: _adicionarTransacao),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Transações'),
      ),
      body: _transacoes.isEmpty
          ? const Center(child: Text('Nenhuma transação adicionada.'))
          : ListView.builder(
              itemCount: _transacoes.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_transacoes[index].toString()),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navegarParaFormulario,
        tooltip: 'Adicionar Transação',
        child: const Icon(Icons.add),
      ),
    );
  }
}
