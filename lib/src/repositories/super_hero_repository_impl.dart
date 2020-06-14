import 'package:dio/dio.dart';

import '../models/super_hero_model.dart';
import 'config/backend_client.dart';
import 'contracts/super_hero_repository.dart';

class SuperHeroRepositoryImpl extends SuperHeroRepository {
  final Dio client = BackendClient().handler;
  @override
  Future<SuperHeroModel> getSuperHeroes(int superHeroId) async {
    final path = "/$superHeroId";
    Response response = await client.get(path);
    if (response.statusCode != 200) {
      throw DioError(request: response.request, response: response);
    }

    return SuperHeroModel.fromJson(response.data);
  }
}
