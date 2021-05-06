import 'package:flutter_to_test/data/models/category_response_model.dart';
import 'package:flutter_to_test/data/models/meals_response_model.dart';
import 'package:http/http.dart' as http;

class WebService {
  WebService._privateConstructor();

  static final WebService _instance = WebService._privateConstructor();

  factory WebService() {
    return _instance;
  }

  Future<List<Category>> getCategories() async {
    final url = Uri.https("www.themealdb.com", "/api/json/v1/1/categories.php");
    final response = await http.get(url);
    final list = categoryResponseFromJson(response.body);
    return list.categories;
  }

  Future<List<Meal>> getMealsByCategory(String category) async {
    var queryParameters = {
      'c': category,
    };
    final url = Uri.https(
        "www.themealdb.com", "/api/json/v1/1/filter.php", queryParameters);
    final response = await http.get(url);
    final list = mealsResponseFromJson(response.body);
    return list.meals;
  }

  Future<List<Meal>> getMealById(String id) async {
    var queryParameters = {
      'i': id,
    };
    final url = Uri.https(
        "www.themealdb.com", "/api/json/v1/1/lookup.php", queryParameters);
    final response = await http.get(url);
    final list = mealsResponseFromJson(response.body);
    return list.meals;
  }
}
