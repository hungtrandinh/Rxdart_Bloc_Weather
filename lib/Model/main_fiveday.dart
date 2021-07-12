class Main_fiveday {
  final double temp;
  final double temp_min;
  final double temp_max;
  final double feels_like;
  final int humidity;
  final int pressure;

  Main_fiveday(this.temp, this.temp_min, this.temp_max, this.humidity,
      this.pressure, this.feels_like);
  Main_fiveday.fromJson(Map<String, dynamic> json)
      : temp = json['temp'].toDouble() ?? "",
        temp_max = json['temp_max'].toDouble() ?? "",
        temp_min = json['temp_min'].toDouble() ?? "",
        humidity = json['humidity'] ?? "",
        pressure = json['pressure'] ?? "",
        feels_like = json['feels_like'].toDouble() ?? "";
}
