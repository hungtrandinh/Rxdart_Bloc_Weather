class Wind {
  final double speed;
  final int deg;

  Wind(this.speed, this.deg);
  Wind.fromJson(Map<String, dynamic> json)
      : speed = json['speed'].toDouble() ?? "",
        deg = json['deg'] ?? "";
}
