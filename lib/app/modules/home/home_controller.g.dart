// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$indexAtom = Atom(name: '_HomeControllerBase.index');

  @override
  int get index {
    _$indexAtom.context.enforceReadPolicy(_$indexAtom);
    _$indexAtom.reportObserved();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.context.conditionallyRunInAction(() {
      super.index = value;
      _$indexAtom.reportChanged();
    }, _$indexAtom, name: '${_$indexAtom.name}_set');
  }

  final _$isPlayAtom = Atom(name: '_HomeControllerBase.isPlay');

  @override
  bool get isPlay {
    _$isPlayAtom.context.enforceReadPolicy(_$isPlayAtom);
    _$isPlayAtom.reportObserved();
    return super.isPlay;
  }

  @override
  set isPlay(bool value) {
    _$isPlayAtom.context.conditionallyRunInAction(() {
      super.isPlay = value;
      _$isPlayAtom.reportChanged();
    }, _$isPlayAtom, name: '${_$isPlayAtom.name}_set');
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeIndex(dynamic value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.changeIndex(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic playPause() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction();
    try {
      return super.playPause();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'index: ${index.toString()},isPlay: ${isPlay.toString()}';
    return '{$string}';
  }
}
