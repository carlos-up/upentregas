class Telefone {
  final String telefone;
  final String situacaoDescricao;
  final int situacao;

  Telefone({
    this.telefone,
    this.situacaoDescricao,
    this.situacao,
  });

  factory Telefone.fromJson(Map<String, dynamic> json) {
    return Telefone(
        telefone: json['telefone'],
        situacaoDescricao: json['situacao_descricao'],
        situacao: json['situacao']);
  }

  // Override toString to have a beautiful log of Project object
  @override
  String toString() {
    return 'Validacao: {telefone = $telefone, situacaoDescricao = $situacaoDescricao, situacao = $situacao}';
  }
}
