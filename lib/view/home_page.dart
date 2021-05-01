import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/forecast_bloc.dart';
import 'forecast_view.dart';

class HomePage extends StatelessWidget {
  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Forecast"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              BlocProvider(
                  create: (_) => BlocProvider.of<ForecastBloc>(context),
                  child: ForecastView()),
            ],
          ),
        ),
      ),
    );
  }
}
