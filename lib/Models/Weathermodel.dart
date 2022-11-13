// To parse this JSON data, do
//
//     final weathermodel = weathermodelFromMap(jsonString);

import 'dart:convert';

class Current {
  int dt;

  int sunrise;
  int sunset;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  int clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  List<Weather>? weather;
  double windGust;
  double pop;
  Rain? rain;
  Current({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.uvi,
    required this.clouds,
    required this.visibility,
    required this.windSpeed,
    required this.windDeg,
    required this.weather,
    required this.windGust,
    required this.pop,
    required this.rain,
  });

  factory Current.fromJson(String str) => Current.fromMap(json.decode(str));

  factory Current.fromMap(Map<String, dynamic> json) => Current(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        temp: json["temp"] == null ? null : json["temp"].toDouble(),
        feelsLike:
            json["feels_like"] == null ? null : json["feels_like"].toDouble(),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint:
            json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
        clouds: json["clouds"],
        visibility: json["visibility"],
        windSpeed:
            json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromMap(x))),
        windGust:
            json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
        rain: json["rain"] == null ? null : Rain.fromMap(json["rain"]),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "temp": temp,
        "feels_like": feelsLike,
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "uvi": uvi,
        "clouds": clouds,
        "visibility": visibility,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather!.map((x) => x.toMap())),
        "wind_gust": windGust,
        "pop": pop,
        "rain": rain == null ? null : rain!.toMap(),
      };
}

class Daily {
  int dt;

  int sunrise;
  int sunset;
  int moonrise;
  int moonset;
  double moonPhase;
  Temp? temp;
  FeelsLike? feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  double windGust;
  List<Weather>? weather;
  int clouds;
  double pop;
  double rain;
  double uvi;
  Daily({
    required this.dt,
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.temp,
    required this.feelsLike,
    required this.pressure,
    required this.humidity,
    required this.dewPoint,
    required this.windSpeed,
    required this.windDeg,
    required this.windGust,
    required this.weather,
    required this.clouds,
    required this.pop,
    required this.rain,
    required this.uvi,
  });

  factory Daily.fromJson(String str) => Daily.fromMap(json.decode(str));

  factory Daily.fromMap(Map<String, dynamic> json) => Daily(
        dt: json["dt"],
        sunrise: json["sunrise"],
        sunset: json["sunset"],
        moonrise: json["moonrise"],
        moonset: json["moonset"],
        moonPhase:
            json["moon_phase"] == null ? null : json["moon_phase"].toDouble(),
        temp: json["temp"] == null ? null : Temp.fromMap(json["temp"]),
        feelsLike: json["feels_like"] == null
            ? null
            : FeelsLike.fromMap(json["feels_like"]),
        pressure: json["pressure"],
        humidity: json["humidity"],
        dewPoint:
            json["dew_point"] == null ? null : json["dew_point"].toDouble(),
        windSpeed:
            json["wind_speed"] == null ? null : json["wind_speed"].toDouble(),
        windDeg: json["wind_deg"],
        windGust:
            json["wind_gust"] == null ? null : json["wind_gust"].toDouble(),
        weather: json["weather"] == null
            ? null
            : List<Weather>.from(
                json["weather"].map((x) => Weather.fromMap(x))),
        clouds: json["clouds"],
        pop: json["pop"] == null ? null : json["pop"].toDouble(),
        rain: json["rain"] == null ? null : json["rain"].toDouble(),
        uvi: json["uvi"] == null ? null : json["uvi"].toDouble(),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "sunrise": sunrise,
        "sunset": sunset,
        "moonrise": moonrise,
        "moonset": moonset,
        "moon_phase": moonPhase,
        "temp": temp == null ? null : temp!.toMap(),
        "feels_like": feelsLike == null ? null : feelsLike!.toMap(),
        "pressure": pressure,
        "humidity": humidity,
        "dew_point": dewPoint,
        "wind_speed": windSpeed,
        "wind_deg": windDeg,
        "wind_gust": windGust,
        "weather": weather == null
            ? null
            : List<dynamic>.from(weather!.map((x) => x.toMap())),
        "clouds": clouds,
        "pop": pop,
        "rain": rain,
        "uvi": uvi,
      };
}

enum Description {
  SCATTERED_CLOUDS,
  LIGHT_RAIN,
  OVERCAST_CLOUDS,
  BROKEN_CLOUDS
}

class FeelsLike {
  double day;

  double night;
  double eve;
  double morn;
  FeelsLike({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLike.fromJson(String str) => FeelsLike.fromMap(json.decode(str));

  factory FeelsLike.fromMap(Map<String, dynamic> json) => FeelsLike(
        day: json["day"] == null ? null : json["day"].toDouble(),
        night: json["night"] == null ? null : json["night"].toDouble(),
        eve: json["eve"] == null ? null : json["eve"].toDouble(),
        morn: json["morn"] == null ? null : json["morn"].toDouble(),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "day": day,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

enum Icon { THE_03_N, THE_10_D, THE_04_D, THE_04_N, THE_10_N }

enum Main { CLOUDS, RAIN }

class Minutely {
  int dt;

  int precipitation;
  Minutely({
    required this.dt,
    required this.precipitation,
  });

  factory Minutely.fromJson(String str) => Minutely.fromMap(json.decode(str));

  factory Minutely.fromMap(Map<String, dynamic> json) => Minutely(
        dt: json["dt"],
        precipitation: json["precipitation"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "dt": dt,
        "precipitation": precipitation,
      };
}

class Rain {
  double the1H;

  Rain({
    required this.the1H,
  });

  factory Rain.fromJson(String str) => Rain.fromMap(json.decode(str));

  factory Rain.fromMap(Map<String, dynamic> json) => Rain(
        the1H: json["1h"] == null ? null : json["1h"].toDouble(),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "1h": the1H,
      };
}

class Temp {
  double day;

  double min;
  double max;
  double night;
  double eve;
  double morn;
  Temp({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory Temp.fromJson(String str) => Temp.fromMap(json.decode(str));

  factory Temp.fromMap(Map<String, dynamic> json) => Temp(
        day: json["day"] == null ? null : json["day"].toDouble(),
        min: json["min"] == null ? null : json["min"].toDouble(),
        max: json["max"] == null ? null : json["max"].toDouble(),
        night: json["night"] == null ? null : json["night"].toDouble(),
        eve: json["eve"] == null ? null : json["eve"].toDouble(),
        morn: json["morn"] == null ? null : json["morn"].toDouble(),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "day": day,
        "min": min,
        "max": max,
        "night": night,
        "eve": eve,
        "morn": morn,
      };
}

class Weather {
  int id;

  Main? main;
  Description? description;
  Icon? icon;
  Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory Weather.fromJson(String str) => Weather.fromMap(json.decode(str));

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
        id: json["id"],
        main: json["main"],
        description: json["description"],
        icon: json["icon"],
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "main": main,
        "description": description,
        "icon": icon,
      };
}

class Weathermodel {
  double lat;

  double lon;
  String timezone;
  int timezoneOffset;
  Current? current;
  List<Minutely>? minutely;
  List<Current>? hourly;
  List<Daily>? daily;
  Weathermodel({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
  });

  factory Weathermodel.fromJson(String str) =>
      Weathermodel.fromMap(json.decode(str));

  factory Weathermodel.fromMap(Map<String, dynamic> json) => Weathermodel(
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        lon: json["lon"] == null ? null : json["lon"].toDouble(),
        timezone: json["timezone"],
        timezoneOffset: json["timezone_offset"],
        current:
            json["current"] == null ? null : Current.fromMap(json["current"]),
        minutely: json["minutely"] == null
            ? null
            : List<Minutely>.from(
                json["minutely"].map((x) => Minutely.fromMap(x))),
        hourly: json["hourly"] == null
            ? null
            : List<Current>.from(json["hourly"].map((x) => Current.fromMap(x))),
        daily: json["daily"] == null
            ? null
            : List<Daily>.from(json["daily"].map((x) => Daily.fromMap(x))),
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "lat": lat,
        "lon": lon,
        "timezone": timezone,
        "timezone_offset": timezoneOffset,
        "current": current == null ? null : current!.toMap(),
        "minutely": minutely == null
            ? null
            : List<dynamic>.from(minutely!.map((x) => x.toMap())),
        "hourly": hourly == null
            ? null
            : List<dynamic>.from(hourly!.map((x) => x.toMap())),
        "daily": daily == null
            ? null
            : List<dynamic>.from(daily!.map((x) => x.toMap())),
      };
}
