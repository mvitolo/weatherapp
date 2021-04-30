import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:weatherapp/engine/api.dart';
import 'package:weatherapp/model/forecast.dart';
import 'package:http/testing.dart';

// Create a MockClient using the Mock class provided by the Mockito package.
// Create new instances of this class in each test.
// class MockClient extends Mock implements http.Client {}

main() {
  group('fetch Friends', () {
    test('returns a list of 1 Friends', () async {
      final api = Api();

      final fjson = '''{
    "cod": "200",
    "message": 0,
    "cnt": 5,
    "list": [
        {
            "dt": 1619773200,
            "main": {
                "temp": 279.7,
                "feels_like": 278.03,
                "temp_min": 279.7,
                "temp_max": 281.53,
                "pressure": 1016,
                "sea_level": 1016,
                "grnd_level": 1012,
                "humidity": 66,
                "temp_kf": -1.83
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "clouds": {
                "all": 39
            },
            "wind": {
                "speed": 2.32,
                "deg": 21,
                "gust": 2.92
            },
            "visibility": 10000,
            "pop": 0,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-04-30 09:00:00"
        },
        {
            "dt": 1619784000,
            "main": {
                "temp": 282.94,
                "feels_like": 281.86,
                "temp_min": 282.94,
                "temp_max": 285.02,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 1012,
                "humidity": 48,
                "temp_kf": -2.08
            },
            "weather": [
                {
                    "id": 802,
                    "main": "Clouds",
                    "description": "scattered clouds",
                    "icon": "03d"
                }
            ],
            "clouds": {
                "all": 37
            },
            "wind": {
                "speed": 2.31,
                "deg": 5,
                "gust": 2.17
            },
            "visibility": 10000,
            "pop": 0.02,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-04-30 12:00:00"
        },
        {
            "dt": 1619794800,
            "main": {
                "temp": 285.9,
                "feels_like": 284.04,
                "temp_min": 285.9,
                "temp_max": 285.9,
                "pressure": 1013,
                "sea_level": 1013,
                "grnd_level": 1010,
                "humidity": 31,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 98
            },
            "wind": {
                "speed": 2.87,
                "deg": 2,
                "gust": 2.21
            },
            "visibility": 10000,
            "pop": 0.52,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-04-30 15:00:00"
        },
        {
            "dt": 1619805600,
            "main": {
                "temp": 284.44,
                "feels_like": 282.72,
                "temp_min": 284.44,
                "temp_max": 284.44,
                "pressure": 1014,
                "sea_level": 1014,
                "grnd_level": 1010,
                "humidity": 42,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 804,
                    "main": "Clouds",
                    "description": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "clouds": {
                "all": 92
            },
            "wind": {
                "speed": 0.33,
                "deg": 62,
                "gust": 1.36
            },
            "visibility": 10000,
            "pop": 0.56,
            "sys": {
                "pod": "d"
            },
            "dt_txt": "2021-04-30 18:00:00"
        },
        {
            "dt": 1619816400,
            "main": {
                "temp": 280.81,
                "feels_like": 280.02,
                "temp_min": 280.81,
                "temp_max": 280.81,
                "pressure": 1015,
                "sea_level": 1015,
                "grnd_level": 1012,
                "humidity": 74,
                "temp_kf": 0
            },
            "weather": [
                {
                    "id": 500,
                    "main": "Rain",
                    "description": "light rain",
                    "icon": "10n"
                }
            ],
            "clouds": {
                "all": 86
            },
            "wind": {
                "speed": 1.6,
                "deg": 41,
                "gust": 2.6
            },
            "visibility": 10000,
            "pop": 0.34,
            "rain": {
                "3h": 0.4
            },
            "sys": {
                "pod": "n"
            },
            "dt_txt": "2021-04-30 21:00:00"
        }
    ],
    "city": {
        "id": 2643743,
        "name": "London",
        "coord": {
            "lat": 51.5085,
            "lon": -0.1257
        },
        "country": "GB",
        "population": 1000000,
        "timezone": 3600,
        "sunrise": 1619757233,
        "sunset": 1619810479
    }
}''';

      final client = MockClient((request) async {
        return Response(fjson, 200,
            headers: {'content-type': 'application/json'});
      });

      api.client = client;

      List<Forecast> list = await api.forecasts();

      expect(list.length, 5);
    });
  });
}
