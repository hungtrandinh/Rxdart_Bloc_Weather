class MainWeather {
  final double temp;
  final double temp_min;
  final double temp_max;
  final double feels_like;
  final int humidity;
  final int pressure;

  MainWeather(this.temp, this.temp_min, this.temp_max, this.feels_like,
      this.humidity, this.pressure);
  MainWeather.fromJson(Map<String, dynamic> json)
      : temp = json['temp'].toDouble() ?? "",
        temp_min = json['temp_min'].toDouble() ?? "",
        temp_max = json['temp_max'].toDouble() ?? "",
        feels_like = json['feels_like'].toDouble() ?? "",
        humidity = json['humidity'] ?? "",
        pressure = json['pressure'] ?? "";
}
