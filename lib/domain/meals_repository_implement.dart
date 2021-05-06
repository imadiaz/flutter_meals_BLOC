import 'package:flutter_to_test/data/models/meals_response_model.dart';
import 'package:flutter_to_test/data/remote/remote_meals_data_source.dart';

abstract class CategoryRepository {
  Future<List<Meal>> getMealsByCategory(String category);
  Future<List<Meal>> getMealById(String id);
}

class MealsRepositoryImplement implements CategoryRepository {
  RemoteMealsDataSource remoteDataSource = RemoteMealsDataSource();

  MealsRepositoryImplement._privateConstructor();

  static final MealsRepositoryImplement _instance =
      MealsRepositoryImplement._privateConstructor();

  factory MealsRepositoryImplement() {
    return _instance;
  }

  @override
  Future<List<Meal>> getMealsByCategory(String category) =>
      this.remoteDataSource.getMealsByCategory(category);

  @override
  Future<List<Meal>> getMealById(String id) =>
      this.remoteDataSource.getMealById(id);
}
