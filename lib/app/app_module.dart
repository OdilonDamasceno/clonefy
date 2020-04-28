import 'package:spotify_clone/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/app/app_widget.dart';
import 'package:spotify_clone/app/modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/login/pages/create_account/create_account_controller.dart';
import 'modules/login/pages/create_account/create_account_page.dart';
import 'modules/login/pages/rescue_account/rescue_account_controller.dart';
import 'modules/login/pages/rescue_account/rescue_account_page.dart';
import 'modules/login/pages/sign_in/sign_in_controller.dart';
import 'modules/login/pages/sign_in/sign_in_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RescueAccountController()),
        Bind((i) => SignInController()),
        Bind((i) => CreateAccountController()),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/home', module: HomeModule()),
        Router('/login', module: LoginModule()),
        Router(
          '/create',
          child: (_, args) => CreateAccountPage(),
          transition: TransitionType.rightToLeft,
        ),
        Router(
          '/signin',
          child: (_, args) => SignInPage(),
          transition: TransitionType.noTransition,
        ),
        Router(
          '/rescue',
          child: (_, args) => RescueAccountPage(),
          transition: TransitionType.noTransition,
        ),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
