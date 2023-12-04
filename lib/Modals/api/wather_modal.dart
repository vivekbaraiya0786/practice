// import 'dart:convert';
class WeatherModal {
  Map location;
  Map current;
  Map condition;
  String name;
  String country;
  String text;
  int is_day;
  Map forecast;
  List forecastday;
  String date;
  Map day;
  double maxtemp_c;
  Map astro;
  String sunrise;
  List hour;
  int time_epoch;
  Map condition1;
  String text1;
  String icon1;

  WeatherModal({
    required this.location,
    required this.name,
    required this.country,
    required this.current,
    required this.is_day,
    required this.condition,
    required this.text,
    required this.forecast,
    required this.forecastday,
    required this.date,
    required this.day,
    required this.maxtemp_c,
    required this.astro,
    required this.sunrise,
    required this.hour,
    required this.time_epoch,
    required this.condition1,
    required this.text1,
    required this.icon1,
  });

  factory WeatherModal.fromJson({required Map json}) {
    return WeatherModal(
      location: json['location'],
      name: json['location']['name'],
      country: json['location']['country'],
      current: json['current'],
      is_day: json['current']['is_day'],
      condition: json['current']['condition'],
      text: json['current']['condition']['text'],
      forecast: json['forecast'],
      forecastday: json['forecast']['forecastday'],
      date: json['forecast']['forecastday'][i]['date'],
      day: json['forecast']['forecastday'][i]['day'],
      maxtemp_c: json['forecast']['forecastday'][i]['day']['maxtemp_c'],
      astro: json['forecast']['forecastday'][i]['astro'],
      sunrise: json['forecast']['forecastday'][i]['astro']['sunrise'],
      hour: json['forecast']['forecastday'][i]['hour'],
      time_epoch: json['forecast']['forecastday'][i]['hour'][i]['time_epoch'],
      condition1: json['forecast']['forecastday'][i]['hour'][i]['condition'],
      text1: json['forecast']['forecastday'][i]['hour'][i]['condition']['text'],
      icon1: json['forecast']['forecastday'][i]['hour'][i]['condition']['icon'],
    );
  }
}

int i = 0;
//
// //
// //
// class WeatherModal {
//   Location location;
//   Current current;
//   Forecast forecast;
//   Alerts alerts;
//
//   WeatherModal({
//     required this.location,
//     required this.current,
//     required this.forecast,
//     required this.alerts,
//   });
//
//   // factory WeatherModal.fromRawJson(String str) => WeatherModal.fromJson(json.decode(str));
//
//   factory WeatherModal.fromJson({required Map<String, dynamic> json}) =>
//       WeatherModal(
//         location: Location.fromJson(json: json["location"]),
//         current: Current.fromJson(json: json["current"]),
//         forecast: Forecast.fromJson(json: json["forecast"]),
//         alerts: Alerts.fromJson(json: json["alerts"]),
//       );
// }
//
// class Alerts {
//   List<dynamic> alert;
//
//   Alerts({
//     required this.alert,
//   });
//
//   // factory Alerts.fromRawJson(String str) => Alerts.fromJson(json.decode(str));
//
//   factory Alerts.fromJson({required Map<String, dynamic> json}) => Alerts(
//         alert: List<dynamic>.from(json["alert"].map((x) => x)),
//       );
// }
//
// class Current {
//   int lastUpdatedEpoch;
//   String lastUpdated;
//   int tempC;
//   int tempF;
//   int isDay;
//   Condition condition;
//   double windMph;
//   int windKph;
//   int windDegree;
//   String windDir;
//   int pressureMb;
//   double pressureIn;
//   double precipMm;
//   int precipIn;
//   int humidity;
//   int cloud;
//   double feelslikeC;
//   double feelslikeF;
//   int visKm;
//   int visMiles;
//   int uv;
//   double gustMph;
//   double gustKph;
//   Map<String, double> airQuality;
//
//   Current({
//     required this.lastUpdatedEpoch,
//     required this.lastUpdated,
//     required this.tempC,
//     required this.tempF,
//     required this.isDay,
//     required this.condition,
//     required this.windMph,
//     required this.windKph,
//     required this.windDegree,
//     required this.windDir,
//     required this.pressureMb,
//     required this.pressureIn,
//     required this.precipMm,
//     required this.precipIn,
//     required this.humidity,
//     required this.cloud,
//     required this.feelslikeC,
//     required this.feelslikeF,
//     required this.visKm,
//     required this.visMiles,
//     required this.uv,
//     required this.gustMph,
//     required this.gustKph,
//     required this.airQuality,
//   });
//
//   // factory Current.fromRawJson(String str) => Current.fromJson(json.decode(str));
//
//   factory Current.fromJson({required Map<String, dynamic> json}) => Current(
//         lastUpdatedEpoch: json["last_updated_epoch"],
//         lastUpdated: json["last_updated"],
//         tempC: json["temp_c"],
//         tempF: json["temp_f"],
//         isDay: json["is_day"],
//         condition: Condition.fromJson(json: json["condition"]),
//         windMph: json["wind_mph"]?.toDouble(),
//         windKph: json["wind_kph"],
//         windDegree: json["wind_degree"],
//         windDir: json["wind_dir"],
//         pressureMb: json["pressure_mb"],
//         pressureIn: json["pressure_in"]?.toDouble(),
//         precipMm: json["precip_mm"]?.toDouble(),
//         precipIn: json["precip_in"],
//         humidity: json["humidity"],
//         cloud: json["cloud"],
//         feelslikeC: json["feelslike_c"]?.toDouble(),
//         feelslikeF: json["feelslike_f"]?.toDouble(),
//         visKm: json["vis_km"],
//         visMiles: json["vis_miles"],
//         uv: json["uv"],
//         gustMph: json["gust_mph"]?.toDouble(),
//         gustKph: json["gust_kph"]?.toDouble(),
//         airQuality: Map.from(json["air_quality"])
//             .map((k, v) => MapEntry<String, double>(k, v?.toDouble())),
//       );
// }
//
// class Condition {
//   String text;
//   String icon;
//   int code;
//
//   Condition({
//     required this.text,
//     required this.icon,
//     required this.code,
//   });
//
//   // factory Condition.fromRawJson(String str) => Condition.fromJson(json.decode(str));
//
//   factory Condition.fromJson({required Map<String, dynamic> json}) => Condition(
//         text: json["text"],
//         icon: json["icon"],
//         code: json["code"],
//       );
// }
//
// class Forecast {
//   List<Forecastday> forecastday;
//
//   Forecast({
//     required this.forecastday,
//   });
//
//   // factory Forecast.fromRawJson(String str) => Forecast.fromJson(json.decode(str));
//
//   factory Forecast.fromJson({required Map<String, dynamic> json}) => Forecast(
//         forecastday: List<Forecastday>.from(
//             json["forecastday"].map((x) => Forecastday.fromJson(json: x))),
//       );
// }
//
// class Forecastday {
//   DateTime date;
//   int dateEpoch;
//   Day day;
//   Astro astro;
//   List<Hour> hour;
//
//   Forecastday({
//     required this.date,
//     required this.dateEpoch,
//     required this.day,
//     required this.astro,
//     required this.hour,
//   });
//
//   // factory Forecastday.fromRawJson(String str) => Forecastday.fromJson(json.decode(str));
//
//   factory Forecastday.fromJson({required Map<String, dynamic> json}) =>
//       Forecastday(
//         date: DateTime.parse(json["date"]),
//         dateEpoch: json["date_epoch"],
//         day: Day.fromJson(json: json["day"]),
//         astro: Astro.fromJson(json["astro"]),
//         hour: List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
//       );
// }
//
// class Astro {
//   String sunrise;
//   String sunset;
//   String moonrise;
//   String moonset;
//   String moonPhase;
//   String moonIllumination;
//   int isMoonUp;
//   int isSunUp;
//
//   Astro({
//     required this.sunrise,
//     required this.sunset,
//     required this.moonrise,
//     required this.moonset,
//     required this.moonPhase,
//     required this.moonIllumination,
//     required this.isMoonUp,
//     required this.isSunUp,
//   });
//
//   factory Astro.fromRawJson(String str) => Astro.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Astro.fromJson(Map<String, dynamic> json) => Astro(
//         sunrise: json["sunrise"],
//         sunset: json["sunset"],
//         moonrise: json["moonrise"],
//         moonset: json["moonset"],
//         moonPhase: json["moon_phase"],
//         moonIllumination: json["moon_illumination"],
//         isMoonUp: json["is_moon_up"],
//         isSunUp: json["is_sun_up"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "sunrise": sunrise,
//         "sunset": sunset,
//         "moonrise": moonrise,
//         "moonset": moonset,
//         "moon_phase": moonPhase,
//         "moon_illumination": moonIllumination,
//         "is_moon_up": isMoonUp,
//         "is_sun_up": isSunUp,
//       };
// }
//
// class Day {
//   double maxtempC;
//   double maxtempF;
//   double mintempC;
//   double mintempF;
//   double avgtempC;
//   double avgtempF;
//   double maxwindMph;
//   double maxwindKph;
//   double totalprecipMm;
//   double totalprecipIn;
//   int totalsnowCm;
//   double avgvisKm;
//   int avgvisMiles;
//   int avghumidity;
//   int dailyWillItRain;
//   int dailyChanceOfRain;
//   int dailyWillItSnow;
//   int dailyChanceOfSnow;
//   Condition condition;
//   int uv;
//
//   Day({
//     required this.maxtempC,
//     required this.maxtempF,
//     required this.mintempC,
//     required this.mintempF,
//     required this.avgtempC,
//     required this.avgtempF,
//     required this.maxwindMph,
//     required this.maxwindKph,
//     required this.totalprecipMm,
//     required this.totalprecipIn,
//     required this.totalsnowCm,
//     required this.avgvisKm,
//     required this.avgvisMiles,
//     required this.avghumidity,
//     required this.dailyWillItRain,
//     required this.dailyChanceOfRain,
//     required this.dailyWillItSnow,
//     required this.dailyChanceOfSnow,
//     required this.condition,
//     required this.uv,
//   });
//
//   // factory Day.fromRawJson(String str) => Day.fromJson(json.decode(str));
//
//   factory Day.fromJson({required Map<String, dynamic> json}) => Day(
//         maxtempC: json["maxtemp_c"]?.toDouble(),
//         maxtempF: json["maxtemp_f"]?.toDouble(),
//         mintempC: json["mintemp_c"]?.toDouble(),
//         mintempF: json["mintemp_f"]?.toDouble(),
//         avgtempC: json["avgtemp_c"]?.toDouble(),
//         avgtempF: json["avgtemp_f"]?.toDouble(),
//         maxwindMph: json["maxwind_mph"]?.toDouble(),
//         maxwindKph: json["maxwind_kph"]?.toDouble(),
//         totalprecipMm: json["totalprecip_mm"]?.toDouble(),
//         totalprecipIn: json["totalprecip_in"]?.toDouble(),
//         totalsnowCm: json["totalsnow_cm"],
//         avgvisKm: json["avgvis_km"]?.toDouble(),
//         avgvisMiles: json["avgvis_miles"],
//         avghumidity: json["avghumidity"],
//         dailyWillItRain: json["daily_will_it_rain"],
//         dailyChanceOfRain: json["daily_chance_of_rain"],
//         dailyWillItSnow: json["daily_will_it_snow"],
//         dailyChanceOfSnow: json["daily_chance_of_snow"],
//         condition: Condition.fromJson(json: json["condition"]),
//         uv: json["uv"],
//       );
// }
//
// class Hour {
//   int timeEpoch;
//   String time;
//   double tempC;
//   double tempF;
//   int isDay;
//   Condition condition;
//   double windMph;
//   double windKph;
//   int windDegree;
//   String windDir;
//   int pressureMb;
//   double pressureIn;
//   double precipMm;
//   double precipIn;
//   int humidity;
//   int cloud;
//   double feelslikeC;
//   double feelslikeF;
//   double windchillC;
//   double windchillF;
//   double heatindexC;
//   double heatindexF;
//   double dewpointC;
//   double dewpointF;
//   int willItRain;
//   int chanceOfRain;
//   int willItSnow;
//   int chanceOfSnow;
//   int visKm;
//   int visMiles;
//   double gustMph;
//   double gustKph;
//   int uv;
//
//   Hour({
//     required this.timeEpoch,
//     required this.time,
//     required this.tempC,
//     required this.tempF,
//     required this.isDay,
//     required this.condition,
//     required this.windMph,
//     required this.windKph,
//     required this.windDegree,
//     required this.windDir,
//     required this.pressureMb,
//     required this.pressureIn,
//     required this.precipMm,
//     required this.precipIn,
//     required this.humidity,
//     required this.cloud,
//     required this.feelslikeC,
//     required this.feelslikeF,
//     required this.windchillC,
//     required this.windchillF,
//     required this.heatindexC,
//     required this.heatindexF,
//     required this.dewpointC,
//     required this.dewpointF,
//     required this.willItRain,
//     required this.chanceOfRain,
//     required this.willItSnow,
//     required this.chanceOfSnow,
//     required this.visKm,
//     required this.visMiles,
//     required this.gustMph,
//     required this.gustKph,
//     required this.uv,
//   });
//
//   factory Hour.fromRawJson(String str) => Hour.fromJson(json.decode(str));
//
//   String toRawJson() => json.encode(toJson());
//
//   factory Hour.fromJson(Map<String, dynamic> json) => Hour(
//         timeEpoch: json["time_epoch"],
//         time: json["time"],
//         tempC: json["temp_c"]?.toDouble(),
//         tempF: json["temp_f"]?.toDouble(),
//         isDay: json["is_day"],
//         condition: Condition.fromJson(json: json["condition"]),
//         windMph: json["wind_mph"]?.toDouble(),
//         windKph: json["wind_kph"]?.toDouble(),
//         windDegree: json["wind_degree"],
//         windDir: json["wind_dir"],
//         pressureMb: json["pressure_mb"],
//         pressureIn: json["pressure_in"]?.toDouble(),
//         precipMm: json["precip_mm"]?.toDouble(),
//         precipIn: json["precip_in"]?.toDouble(),
//         humidity: json["humidity"],
//         cloud: json["cloud"],
//         feelslikeC: json["feelslike_c"]?.toDouble(),
//         feelslikeF: json["feelslike_f"]?.toDouble(),
//         windchillC: json["windchill_c"]?.toDouble(),
//         windchillF: json["windchill_f"]?.toDouble(),
//         heatindexC: json["heatindex_c"]?.toDouble(),
//         heatindexF: json["heatindex_f"]?.toDouble(),
//         dewpointC: json["dewpoint_c"]?.toDouble(),
//         dewpointF: json["dewpoint_f"]?.toDouble(),
//         willItRain: json["will_it_rain"],
//         chanceOfRain: json["chance_of_rain"],
//         willItSnow: json["will_it_snow"],
//         chanceOfSnow: json["chance_of_snow"],
//         visKm: json["vis_km"],
//         visMiles: json["vis_miles"],
//         gustMph: json["gust_mph"]?.toDouble(),
//         gustKph: json["gust_kph"]?.toDouble(),
//         uv: json["uv"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "time_epoch": timeEpoch,
//         "time": time,
//         "temp_c": tempC,
//         "temp_f": tempF,
//         "is_day": isDay,
//         "condition": condition,
//         "wind_mph": windMph,
//         "wind_kph": windKph,
//         "wind_degree": windDegree,
//         "wind_dir": windDir,
//         "pressure_mb": pressureMb,
//         "pressure_in": pressureIn,
//         "precip_mm": precipMm,
//         "precip_in": precipIn,
//         "humidity": humidity,
//         "cloud": cloud,
//         "feelslike_c": feelslikeC,
//         "feelslike_f": feelslikeF,
//         "windchill_c": windchillC,
//         "windchill_f": windchillF,
//         "heatindex_c": heatindexC,
//         "heatindex_f": heatindexF,
//         "dewpoint_c": dewpointC,
//         "dewpoint_f": dewpointF,
//         "will_it_rain": willItRain,
//         "chance_of_rain": chanceOfRain,
//         "will_it_snow": willItSnow,
//         "chance_of_snow": chanceOfSnow,
//         "vis_km": visKm,
//         "vis_miles": visMiles,
//         "gust_mph": gustMph,
//         "gust_kph": gustKph,
//         "uv": uv,
//       };
// }
//
// class Location {
//   String name;
//   String region;
//   String country;
//   double lat;
//   double lon;
//   String tzId;
//   int localtimeEpoch;
//   String localtime;
//
//   Location({
//     required this.name,
//     required this.region,
//     required this.country,
//     required this.lat,
//     required this.lon,
//     required this.tzId,
//     required this.localtimeEpoch,
//     required this.localtime,
//   });
//
//   // factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));
//
//   factory Location.fromJson({required Map<String, dynamic> json}) => Location(
//         name: json["name"],
//         region: json["region"],
//         country: json["country"],
//         lat: json["lat"]?.toDouble(),
//         lon: json["lon"]?.toDouble(),
//         tzId: json["tz_id"],
//         localtimeEpoch: json["localtime_epoch"],
//         localtime: json["localtime"],
//       );
// }
