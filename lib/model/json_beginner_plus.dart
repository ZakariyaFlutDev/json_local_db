class IeltsInfoPlus{
  int id;
  String name;
  String band;
  List<String> bands;

  IeltsInfoPlus({required this.id, required this.name, required this.band, required this.bands});

  factory IeltsInfoPlus.fromJson(Map<String, dynamic> json){
    return IeltsInfoPlus(id: json['id'], name: json['name'], band: json['band'], bands: List<String>.from(json['bands']));
  }


}