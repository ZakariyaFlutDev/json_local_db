class IeltsInfoThird {
  int id;
  String name;
  String band;
  Bands bands;

  IeltsInfoThird(
      {required this.id,
      required this.name,
      required this.band,
      required this.bands});

  factory IeltsInfoThird.fromJson(Map<String, dynamic> json) {
    return IeltsInfoThird(
        id: json['id'],
        name: json['name'],
        band: json['band'],
        bands: Bands.fromMap(json['bands'])
    );
  }
}

class Bands {
  String writing;
  String reading;
  String listening;
  String speaking;

  Bands(
      {required this.writing,
      required this.reading,
      required this.listening,
      required this.speaking});

  factory Bands.fromMap(Map<String, dynamic> jsonData) {
    return Bands(
        writing: jsonData['writing'],
        reading: jsonData['reading'],
        listening: jsonData['listening'],
        speaking: jsonData['speaking']);
  }
}
