final class Country {
  final String name;

  Country({required this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(name: json['name']['common']);
  }

  static List<Country> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Country.fromJson(json)).toList();
  }
}
