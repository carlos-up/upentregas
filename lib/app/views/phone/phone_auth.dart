import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:upentregas/app/models/showtoast_model.dart';
import 'package:upentregas/app/models/telefone_model.dart';
import 'package:upentregas/app/repositories/validation_repository.dart';
import 'package:upentregas/app/views/otp/otp_screen.dart';

class PhoneLogin extends StatefulWidget {
  PhoneLogin({Key key}) : super(key: key);

  @override
  _PhoneLoginState createState() => _PhoneLoginState();

  get context => context;

  void telefoneValidation(Telefone validacao, String phoneNo) {
    String phone = validacao.telefone;
    int situacao = validacao.situacao;
    String situacaoDescricao = validacao.situacaoDescricao;

    if (phoneNo == phone && situacao == 0 && situacaoDescricao == "ATIVO") {
      showToast("Telefone VALIDO!", Colors.blue);
      Get.to(
        OTPScreen(
          mobileNumber: phoneNo,
        ),
      );
    } else if (phoneNo == phone &&
        situacao == 1 &&
        situacaoDescricao == "INATIVO") {
      showToast("Telefone INATIVO entre em contato conosco!", Colors.red);
    } else {
      showToast(
          "Nao existe licenca valida, entre em contato conosco", Colors.red);
    }
  }
}

class _PhoneLoginState extends State<PhoneLogin> {
  String phoneNo;
  bool isValid = false;

  Telefone telefone = Telefone();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(30),
          height: MediaQuery.of(context).size.height * 0.7,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'LOGIN',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  //color: Colors.white,
                ),
              ),
              Text(
                'Faca login para verificar suas entregas',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  //color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(27.0),
                child: InternationalPhoneInput(
                  hintText: "(00) 99999-9999",
                  onPhoneNumberChange: onPhoneNumberChange,
                  initialPhoneNumber: phoneNo,
                  initialSelection: 'BR',
                  showCountryCodes: true,
                  errorText: "Digite um telefone valido",
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.85,
                    child: RaisedButton(
                      color: !isValid
                          ? Theme.of(context).primaryColor.withOpacity(0.5)
                          : Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0)),
                      child: Text(
                        !isValid
                            ? "DIGITE SEU NUMERO DE TELEFONE"
                            : "CONTINUAR",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        print(phoneNo);
                        validation(phoneNo);
                      },
                      padding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      this.phoneNo = internationalizedPhoneNumber;
      return isValid = true;
    });
  }
}
