import 'package:mobx/mobx.dart';
import 'package:superherogalery/src/models/super_hero_model.dart';
import '../repositories/contracts/super_hero_repository.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final SuperHeroRepository _repository;
  final int _listSize = 731;

  _HomeControllerBase(this._repository) {
    getSuperHeroes();
  }

  @observable
  ObservableList<SuperHeroModel> superHeroList = <SuperHeroModel>[].asObservable();

  @computed
  bool get busy => superHeroList.length < _listSize;

  @computed
  List<SuperHeroModel> get filteredList {
    if (filter.trim().length < 3) {
      return superHeroList;
    }

    return superHeroList
        .where((item) =>
            item.name.toLowerCase().contains(filter.toLowerCase()) ||
            item.biography.fullName.toLowerCase().contains(filter.toLowerCase()) ||
            item.biography.alterEgos.toLowerCase().contains(filter.toLowerCase()) ||
            item.work.occupation.toLowerCase().contains(filter.toLowerCase()) ||
            item.biography.aliases.any(
              (item) => item.toLowerCase().contains(
                    filter.toLowerCase(),
                  ),
            ))
        .toList();
  }

  @observable
  String filter = '';

  @action
  getSuperHeroes() async {
    superHeroList.clear();
    try {
      for (var i = 1; i <= _listSize; i++) {
        final superHero = await _repository.getSuperHeroes(i);
        superHeroList.add(superHero);
      }
    } on Exception catch (e) {
      print(e);
    }
  }

  @action
  updateFilter(String value) => filter = value;
}
