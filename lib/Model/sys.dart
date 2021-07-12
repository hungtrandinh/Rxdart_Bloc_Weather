class Sys {
  final int sunrise;
  final int sunset;
  final String country;

  Sys(this.sunrise, this.sunset, this.country);
  Sys.fromJson(Map<String, dynamic> json)
      : sunrise = json['sunrise'] ?? "",
        sunset = json['sunset'] ?? "",
        country = json['country'] ?? "";
}
