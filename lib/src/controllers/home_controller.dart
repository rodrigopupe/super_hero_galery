import 'package:mobx/mobx.dart';
import 'package:superherogalery/src/models/super_hero_model.dart';
import '../repositories/contracts/super_hero_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final SuperHeroRepository _repository;

  _HomeControllerBase(this._repository) {
    getSuperHeroes();
  }

  @observable
  ObservableList<SuperHeroModel> superHeroList = <SuperHeroModel>[].asObservable();

  @action
  getSuperHeroes() async {
    try {
      for (var i = 0; i < 10; i++) {
        superHeroList.add(await _repository.getSuperHeroes(i));
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
