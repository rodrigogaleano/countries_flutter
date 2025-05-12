enum RegionEnum {
  all,
  africa,
  americas,
  asia,
  europe,
  oceania;

  String get description {
    return switch (this) {
      RegionEnum.all => 'All',
      RegionEnum.africa => 'Africa',
      RegionEnum.americas => 'Americas',
      RegionEnum.asia => 'Asia',
      RegionEnum.europe => 'Europe',
      RegionEnum.oceania => 'Oceania',
    };
  }
}
