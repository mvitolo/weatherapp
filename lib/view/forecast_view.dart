import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.forecast.length,
          itemBuilder: (BuildContext context, int index) {
            Forecast f = state.forecast[index];
            DateTime d = DateTime.fromMillisecondsSinceEpoch(f.dt * 1000);

            return Card(
              child: ListTile(
                leading: Image.network("http://openweathermap.org/img/wn/" +
                    f.weather.first.icon +
                    ".png"),
                title: Text(DateFormat.MMMMEEEEd().format(d)),
                subtitle: Text(
                    f.weather.first.main + " " + f.weather.first.description),
              ),
            );
          },
        );
      }
    });
  }
}
