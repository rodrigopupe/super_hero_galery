import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:superherogalery/src/controllers/home_controller.dart';
import 'package:superherogalery/src/models/super_hero_model.dart';
import 'package:superherogalery/src/repositories/contracts/super_hero_repository.dart';

import 'mock_data.dart';

class SuperHeroRepositoryMock extends Mock implements SuperHeroRepository {}

main() {
  test('When getting super heroes, returning data', () async {
    final superHeroId = '245';
    final superHero = SuperHeroModel.fromJson(superHeroEthanHunt);
    final SuperHeroRepository repository = SuperHeroRepositoryMock();
    when(repository.getSuperHeroes(superHeroId)).thenAnswer((_) => Future.value(superHero));
    
    final controller = HomeController(repository);
    controller.getSuperHeroes();
    await Future.delayed(Duration(seconds: 5));
    expect(controller.superHeroList.isNotEmpty, true);
  });

  test('When getting super heroes, returning no data', () async {
    final superHeroId = '245';
    final SuperHeroRepository repository = SuperHeroRepositoryMock();
    when(repository.getSuperHeroes(superHeroId)).thenAnswer((_) => Future.value(null));
    
    final controller = HomeController(repository);
    controller.getSuperHeroes();
    await Future.delayed(Duration(seconds: 5));
    expect(controller.superHeroList.isEmpty, true);
  });
}