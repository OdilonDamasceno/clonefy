import 'package:mobx/mobx.dart';

part 'create_account_controller.g.dart';

class CreateAccountController = _CreateAccountControllerBase
    with _$CreateAccountController;

abstract class _CreateAccountControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
