import 'package:flutter/material.dart';
import 'package:upentregas/app/models/showtoast.dart';
import 'package:upentregas/app/models/telefone_model.dart';
import 'package:upentregas/app/views/otp/otp_screen.dart';

telefoneValidation(Telefone validacao, String phoneNo) async {
  String phone = validacao.telefone;
  int situacao = validacao.situacao;
  String situacaoDescricao = validacao.situacaoDescricao;
  bool navegar;

  if (phoneNo == phone && situacao == 0 && situacaoDescricao == "ATIVO") {
    //showToast("Telefone VALIDO!", Colors.blue);
    navegar = true;
  } else if (phoneNo == phone &&
      situacao == 1 &&
      situacaoDescricao == "INATIVO") {
    showToast("Telefone INATIVO entre em contato conosco!", Colors.red);
    navegar = false;
  } else {
    showToast(
        "Nao existe licenca valida, entre em contato conosco", Colors.red);
    navegar = false;
  }

  if (navegar == true) {
    BuildContext context;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OTPScreen(
          mobileNumber: phoneNo,
        ),
      ),
    );
  } else {
    showToast(
        " Telefone $phone, esta $situacaoDescricao, entre em contato com o suporte",
        Colors.red);
  }
}
