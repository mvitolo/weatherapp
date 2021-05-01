import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/city_bloc.dart';
import 'package:weatherapp/view/city_view.dart';

class CityPage extends StatelessWidget {
  static const String route = '/city';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("City"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocProvider(
              create: (_) => BlocProvider.of<CityBloc>(context),
              child: CityView()),
        ),
      ),
    );
  }
}
