import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int index = 0;

  @observable
  bool isPlay = false;

  @action
  changeIndex(value) {
    index = value;
  }
  @action
  playPause(){
    isPlay =!isPlay;
  }

}
