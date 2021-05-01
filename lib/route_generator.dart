import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/city_bloc.dart';
import 'package:weatherapp/repository/bloc_repository.dart';
import 'package:weatherapp/view/city_page.dart';
import 'package:weatherapp/view/home_page.dart';

import 'bloc/forecast_bloc.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.route:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<ForecastBloc>(
                      create: (context) => BlocRepository().forecast),
                ], child: HomePage()));
      case CityPage.route:
        return MaterialPageRoute(
            builder: (context) => MultiBlocProvider(providers: [
                  BlocProvider<CityBloc>(
                      create: (context) => BlocRepository().city!),
                ], child: CityPage()));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
