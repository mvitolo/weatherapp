# WeatherApp

A nice and simple WeatherApp using bloc architecture

## Weather Condition

The app that shows the weather conditions for next 5 days.

The user will be able to change the name of the city to have the related weather conditions.

There are two api call. 
The first one is the one related to [forecast](https://openweathermap.org/forecast5).

This will give forecasts for different hours for each days. I have reduced the result ot just one element for day.

To validate if the City we wanna see the forecast for is valid I have used the [city](https://openweathermap.org/api/geocoding-api) api call.


## Architecture

On the Architecture side I have chosen the [BLoC pattern](https://bloclibrary.dev)
