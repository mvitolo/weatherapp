import 'dart:async';

import 'package:weatherapp/engine/api.dart';
import 'package:weatherapp/model/city.dart';

class CityRepository {
  final _controller = StreamController<City>();
  var api = Api();
  final searchController = StreamController<String>();

  Stream<City> get cities async* {
    searchController.stream.listen((event) {
      print(event);
      api.city(event).then((value) {
        print(value);
        if (value.isNotEmpty) {
          _controller.add(value.first);
        }
      });
    });

    yield* _controller.stream;
  }
}
