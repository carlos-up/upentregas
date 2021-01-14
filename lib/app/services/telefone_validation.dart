import 'package:flutter/material.dart';
import 'package:upentregas/app/models/showtoast.dart';
import 'package:upentregas/app/models/telefone_model.dart';

telefoneValidation(Telefone validacao, String phoneNo) async {
  String phone = validacao.telefone;
  int situacao = validacao.situacao;
  String situacaoDescricao = validacao.situacaoDescricao;

  if (phoneNo == phone && situacao == 0 && situacaoDescricao == "ATIVO") {
    showToast("Telefone VALIDO!", Colors.blue);
    return true;
  } else if (phoneNo == phone &&
      situacao == 1 &&
      situacaoDescricao == "INATIVO") {
    showToast("Telefone INATIVO entre em contato conosco!", Colors.red);
    return false;
  } else {
    showToast(
        "Nao existe licenca valida, entre em contato conosco", Colors.red);
    return false;
  }
}
