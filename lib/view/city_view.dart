import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/city_bloc.dart';
import 'package:weatherapp/bloc/city_state.dart';
import 'package:weatherapp/model/city.dart';

class CityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(builder: (_, state) {
      if (state is CityEmpty) {
        return Center(child: CircularProgressIndicator());
      } else {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.cities.length,
          itemBuilder: (BuildContext context, int index) {
            City c = state.cities[index];

            return Card(
              child: ListTile(
                title: Text(c.name),
              ),
            );
          },
        );
      }
    });
  }
}
