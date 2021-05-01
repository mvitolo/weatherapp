import 'dart:async';

import 'package:weatherapp/engine/api.dart';
import 'package:weatherapp/model/city.dart';

class CityRepository {
  final _controller = StreamController<List<City>>();
  var api = Api();
  final searchController = StreamController<String>();

  Stream<List<City>> get forecast async* {
    searchController.stream.listen((event) {
      print(event);
      api.city(event).then((value) => _controller.add(value));
    });

    yield* _controller.stream;
  }

  void dispose() {
    _controller.close();
    searchController.close();
  }
}
