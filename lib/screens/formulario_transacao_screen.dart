import 'package:flutter/material.dart';
import '../models/transacao.dart';

class FormularioTransacaoScreen extends StatefulWidget {
  final Function(Transacao) onAdicionarTransacao;

  const FormularioTransacaoScreen({required this.onAdicionarTransacao});

  @override
  _FormularioTransacaoScreenState createState() =>
      _FormularioTransacaoScreenState();
}

class _FormularioTransacaoScreenState extends State<FormularioTransacaoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _descricao = '';
  String _valor = '';

  void _salvarTransacao() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final novaTransacao = Transacao(_descricao, _valor);
      widget.onAdicionarTransacao(novaTransacao);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Transação'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                onSaved: (value) {
                  _descricao = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _valor = value!;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um valor';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _salvarTransacao,
                child: const Text('Salvar Transação'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
