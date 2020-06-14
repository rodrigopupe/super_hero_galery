// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  Computed<bool> _$busyComputed;

  @override
  bool get busy => (_$busyComputed ??=
          Computed<bool>(() => super.busy, name: '_HomeControllerBase.busy'))
      .value;

  final _$superHeroListAtom = Atom(name: '_HomeControllerBase.superHeroList');

  @override
  ObservableList<SuperHeroModel> get superHeroList {
    _$superHeroListAtom.reportRead();
    return super.superHeroList;
  }

  @override
  set superHeroList(ObservableList<SuperHeroModel> value) {
    _$superHeroListAtom.reportWrite(value, super.superHeroList, () {
      super.superHeroList = value;
    });
  }

  final _$getSuperHeroesAsyncAction =
      AsyncAction('_HomeControllerBase.getSuperHeroes');

  @override
  Future getSuperHeroes() {
    return _$getSuperHeroesAsyncAction.run(() => super.getSuperHeroes());
  }

  @override
  String toString() {
    return '''
superHeroList: ${superHeroList},
busy: ${busy}
    ''';
  }
}
