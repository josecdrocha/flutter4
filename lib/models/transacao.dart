class Transacao {
  final String descricao;
  final String valor;

  Transacao(this.descricao, this.valor);

  @override
  String toString() {
    return '$descricao - R\$ $valor';
  }
}
