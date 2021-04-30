import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/forecast_bloc.dart';
import 'package:weatherapp/bloc/forecast_state.dart';
import 'package:weatherapp/model/forecast.dart';

class ForecastView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(builder: (_, state) {
      if (state is ForecastEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        //  state.forecast.sort((a, b) => a
        //     .dt
        //     .compareTo(b.dt));
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: state.forecast.length,
            itemBuilder: (BuildContext context, int index) {
              Forecast f = state.forecast[index];
              return Card(
                child: ListTile(
                  title: Text(f.dt_txt.toString()),
                ),
              );
            },
          ),
        );
      }
    });
  }
}
