class Clouds {
  final int colouds;

  Clouds(this.colouds);
  Clouds.fromJson(Map<String, dynamic> json) : colouds = json['all'] ?? "";
}
