import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/city_bloc.dart';
import 'package:weatherapp/view/city_view.dart';

class CityPage extends StatelessWidget {
  static const String route = '/city';

  @override
  Widget build(BuildContext context) {
    CityBloc bloc = BlocProvider.of<CityBloc>(context);
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
        title: new Text("City"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  onChanged: (text) {
                    bloc.repository.searchController.add(text);
                  },
                ),
              ),
              BlocProvider(create: (_) => bloc, child: CityView()),
            ],
          ),
        ),
      ),
    );
  }
}
