class IeltsInfo{
  int id;
  String name;
  String band;

  IeltsInfo({required this.id, required this.name, required this.band});

  factory IeltsInfo.fromJson(Map<String, dynamic> json){
    return IeltsInfo(id: json['id'], name: json['name'], band: json['band']);
  }


}