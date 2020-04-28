import 'package:mobx/mobx.dart';

part 'rescue_account_controller.g.dart';

class RescueAccountController = _RescueAccountControllerBase
    with _$RescueAccountController;

abstract class _RescueAccountControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
