final class Country {
  final String name;
  final String flagPath;

  const Country({required this.name, required this.flagPath});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(name: json['name']['common'], flagPath: json['flags']['png']);
  }

  static List<Country> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Country.fromJson(json)).toList();
  }
}
