import '../../models/super_hero_model.dart';

abstract class SuperHeroRepository {
  Future<SuperHeroModel> getSuperHeroes(int superHeroId);
}