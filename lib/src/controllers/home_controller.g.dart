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
  Computed<List<SuperHeroModel>> _$filteredListComputed;

  @override
  List<SuperHeroModel> get filteredList => (_$filteredListComputed ??=
          Computed<List<SuperHeroModel>>(() => super.filteredList,
              name: '_HomeControllerBase.filteredList'))
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

  final _$filterAtom = Atom(name: '_HomeControllerBase.filter');

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  final _$getSuperHeroesAsyncAction =
      AsyncAction('_HomeControllerBase.getSuperHeroes');

  @override
  Future getSuperHeroes() {
    return _$getSuperHeroesAsyncAction.run(() => super.getSuperHeroes());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic updateFilter(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.updateFilter');
    try {
      return super.updateFilter(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
superHeroList: ${superHeroList},
filter: ${filter},
busy: ${busy},
filteredList: ${filteredList}
    ''';
  }
}
