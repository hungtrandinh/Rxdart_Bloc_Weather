class City {
  final String name;
  final String country;
  final int sunrise;
  final int sunset;

  City(this.name, this.country, this.sunrise, this.sunset);
  City.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? "",
        country = json['country'] ?? "",
        sunrise = json['sunrise'] ?? "",
        sunset = json['sunset'] ?? "";
}
