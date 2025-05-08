final class Country {
  final int population;

  final String name;
  final String region;
  final String? capital;
  final String flagPath;
  final String? subregion;

  const Country({
    required this.name,
    required this.region,
    required this.flagPath,
    required this.population,
    this.capital,
    this.subregion,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      region: json['region'],
      capital: json['capital']?[0],
      name: json['name']['common'],
      subregion: json['subregion'],
      flagPath: json['flags']['png'],
      population: json['population'],
    );
  }

  static List<Country> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Country.fromJson(json)).toList();
  }
}
