import 'dart:async';

import 'package:weatherapp/engine/api.dart';
import 'package:weatherapp/model/forecast.dart';

class ForecastRepository {
  final _controller = StreamController<Forecast>();
  final cityController = StreamController<String>();

  var api = Api();

  ForecastRepository() {
    cityController.add("London");
  }

  Stream<Forecast> get forecast async* {
    cityController.stream.listen((event) {
      api.forecasts(event).then((value) => _controller.add(value));
    });

    yield* _controller.stream;
  }

  void dispose() {
    _controller.close();
  }
}
