class Wind_fiveday {
  final double speed;
  final int deg;
  final double gust;

  Wind_fiveday(this.speed, this.deg, this.gust);
  Wind_fiveday.fromJson(Map<String, dynamic> json)
      : speed = json['speed'].toDouble() ?? "",
        deg = json['deg'] ?? "",
        gust = json['gust'].toDouble() ?? "";
}
