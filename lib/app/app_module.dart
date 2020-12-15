import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:upentregas/app/app_controller.dart';
import 'package:upentregas/app/app_widget.dart';
import 'package:upentregas/app/views/home/home_page.dart';
import 'package:upentregas/app/views/romaneios/romaneiro_page.dart';

class AppModule extends MainModule {
  @override
  //todas as injecoes de dependencias devem estar contidas aqui
  List<Bind> get binds => [
        Bind(
          (i) => AppController(),
        ),
      ];

  @override
  //todas as rotas devem estar contidas aqui
  List<ModularRouter> get routers => [
        ModularRouter(
          '/',
          child: (_, args) => HomePage(),
        ),
        ModularRouter(
          '/romaneio',
          child: (_, args) => RomaneioPage(),
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
