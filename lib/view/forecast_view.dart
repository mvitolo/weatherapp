import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/bloc/forecast_bloc.dart';
import 'package:weatherapp/bloc/forecast_state.dart';
import 'package:weatherapp/model/forecast.dart';

import 'city_page.dart';

class ForecastView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(builder: (_, state) {
      return Column(
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, CityPage.route);
            },
            child: Text(
                (state is ForecastEmpty)
                    ? "Choose a city"
                    : (state as ForecastValue).forecast.city.name,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500, // Set font weight
                  color: Colors.black87, // Set text color
                )),
          ),
          Padding(padding: EdgeInsets.all(8)),
          (state is ForecastEmpty)
              ? Center(child: CircularProgressIndicator())
              : view((state as ForecastValue).forecast.list),
        ],
      );
    });
  }

  Widget view(List<WForecast> list) {
    List<WForecast> values = list.fold([], (previousValue, element) {
      List<WForecast> l = (previousValue as List<WForecast>);

      if (l.length == 0) {
        l.add(element);
        return l;
      }
      if (l.length == 5) {
        return l;
      }
      DateTime previous = DateTime.fromMillisecondsSinceEpoch(l.last.dt * 1000);
      DateTime next = DateTime.fromMillisecondsSinceEpoch(element.dt * 1000);
      if (previous.day != next.day) {
        l.add(element);
      }
      return l;
    });

    return ListView.builder(
      shrinkWrap: true,
      itemCount: values.length,
      itemBuilder: (BuildContext context, int index) {
        WForecast f = values[index];
        DateTime d = DateTime.fromMillisecondsSinceEpoch(f.dt * 1000);

        return Card(
          child: ListTile(
            leading: Image.network("http://openweathermap.org/img/wn/" +
                f.weather.first.icon +
                ".png"),
            title: Text(DateFormat.MMMMEEEEd().format(d)),
            subtitle:
                Text(f.weather.first.main + " " + f.weather.first.description),
          ),
        );
      },
    );
  }
}
