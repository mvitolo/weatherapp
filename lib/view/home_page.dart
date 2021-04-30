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
        actions: [
          IconButton(
            icon: Icon(Icons.map),
            onPressed: () {
              // Navigator.pushNamed(context, MapPage.route);
            },
          )
        ],
        title: new Text("Forecast"),
      ),
      body: SafeArea(
        child: BlocProvider(
            create: (_) => BlocProvider.of<ForecastBloc>(context),
            child: ForecastView()),
      ),
    );
  }
}
