import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_to_test/bloc/bloc/meal_detail_bloc.dart';
import 'package:flutter_to_test/bloc/category/category_bloc.dart';
import 'package:flutter_to_test/bloc/meals/meal_bloc.dart';
import 'package:flutter_to_test/pages/home_page.dart';
import 'package:flutter_to_test/pages/meal_page.dart';
import 'package:flutter_to_test/pages/meals_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategoryBloc()),
        BlocProvider(create: (_) => MealBloc()),
        BlocProvider(create: (_) => MealDetailBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        onGenerateRoute: Router.generateRoute,
      ),
    );
  }
}

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case 'meals':
        return MaterialPageRoute(builder: (_) => MealsPage(settings.arguments));
      case 'meal':
        print(settings.arguments);
        return MaterialPageRoute(
            builder: (_) => MealPage(meal: settings.arguments));
      default:
        return MaterialPageRoute(builder: (_) => Text("Not found"));
    }
  }
}
