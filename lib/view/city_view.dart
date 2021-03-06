import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/city_bloc.dart';
import 'package:weatherapp/bloc/city_event.dart';
import 'package:weatherapp/bloc/city_state.dart';
import 'package:weatherapp/model/city.dart';

class CityView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CityBloc, CityState>(builder: (bloc, state) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: TextField(
              onChanged: (text) {
                BlocProvider.of<CityBloc>(context)
                    .repository
                    .searchController
                    .add(text);
              },
            ),
          ),
          (state is CityEmpty)
              ? Center(child: CircularProgressIndicator())
              : view((state as CityValue).city, context)
        ],
      );
    });
  }

  Widget view(City city, BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(city.name),
        onTap: () {
          BlocProvider.of<CityBloc>(context).choosenCity.add(city.name);
          BlocProvider.of<CityBloc>(context).add(CityLoading());

          BlocProvider.of<CityBloc>(context)
              .repository
              .searchController
              .add("");

          Navigator.pop(context);
        },
      ),
    );
  }
}
