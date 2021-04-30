import 'dart:async';

import 'package:weatherapp/engine/api.dart';
import 'package:weatherapp/model/forecast.dart';

class ForecastRepository {
  final _controller = StreamController<List<Forecast>>();
  var api = Api();

  ForecastRepository();

  Stream<List<Forecast>> get forecast async* {
    api.forecasts().then((value) => _controller.add(value));

    yield* _controller.stream;
  }

  void dispose() {
    _controller.close();
  }
}
