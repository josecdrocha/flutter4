import 'package:flutter/material.dart';
import 'screens/lista_transacoes_screen.dart';

void main() {
  runApp(const BancoApp());
}

class BancoApp extends StatelessWidget {
  const BancoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ListaTransacoesScreen(),
    );
  }
}
