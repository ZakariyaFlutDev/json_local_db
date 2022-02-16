class IeltsInfoFourth {
  int id;
  String name;
  String band;
  Bands bands;

  IeltsInfoFourth(
      {required this.id,
      required this.name,
      required this.band,
      required this.bands});

  factory IeltsInfoFourth.fromJson(Map<String, dynamic> json) {
    return IeltsInfoFourth(
        id: json['id'],
        name: json['name'],
        band: json['band'],
        bands: Bands.fromMap(json['bands']));
  }
}

class Bands {
  Parts reading;
  Parts writing;
  Parts listening;
  Parts speaking;

  Bands(
      {required this.reading,
      required this.writing,
      required this.listening,
      required this.speaking});

  factory Bands.fromMap(Map<String, dynamic> jsonData) {
    return Bands(
        reading: Parts.fromJson(jsonData['reading']),
        writing: Parts.fromJson(jsonData['writing']),
        listening: Parts.fromJson(jsonData['listening']),
        speaking: Parts.fromJson(jsonData['speaking']));
  }
}

class Parts {
  String firstpart;
  String secondpart;

  Parts({required this.firstpart, required this.secondpart});

  factory Parts.fromJson(Map<String, dynamic> jsonData) {
    return Parts(
        firstpart: jsonData['firstpart'], secondpart: jsonData['secondpart']);
  }
}
