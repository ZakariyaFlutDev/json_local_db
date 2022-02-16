import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_local_db/model/json_fourth.dart';
class IeltsJsonFourth extends StatefulWidget {
  const IeltsJsonFourth({Key? key}) : super(key: key);

  @override
  _IeltsJsonFourthState createState() => _IeltsJsonFourthState();
}

class _IeltsJsonFourthState extends State<IeltsJsonFourth> {
  late IeltsInfoFourth _ieltsInfoFourth;

  @override
  void initState() {
    getDataFromLocal().then((value){
      _ieltsInfoFourth = value;
    });
  }

  Future<IeltsInfoFourth> getDataFromLocal()async{
    var data = await rootBundle.loadString("assets/ielts_fourth.json");
    Map<String,dynamic> mapData = jsonDecode(data);
    return IeltsInfoFourth.fromJson(mapData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ielts Info"),
      ),
      body: Center(
          child: FutureBuilder<IeltsInfoFourth>(
            future: getDataFromLocal(),
            builder: (ctx, snapshot){
              if(snapshot.data == null){
                return Text("Data not found");
              }
              else{
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ID: " + _ieltsInfoFourth.id.toString(), style: TextStyle(fontSize: 16),),
                    SizedBox(height: 20,),
                    Text("Name: "+_ieltsInfoFourth.name, style: TextStyle(fontSize: 30),),
                    SizedBox(height: 20,),
                    Text("Band: "+_ieltsInfoFourth.band.toString(), style: TextStyle(fontSize: 22),),
                    SizedBox(height: 50,),
                    Text("Reading first band: " + _ieltsInfoFourth.bands.reading.firstpart),
                    Text("Reading second band: " + _ieltsInfoFourth.bands.reading.secondpart),
                    Text("Writing first band: " + _ieltsInfoFourth.bands.writing.firstpart),
                    Text("Writing second band: " + _ieltsInfoFourth.bands.writing.secondpart),
                    Text("Listening first band: " + _ieltsInfoFourth.bands.listening.firstpart),
                    Text("Listening second band: " + _ieltsInfoFourth.bands.listening.secondpart),
                    Text("Speakin firstg band: " + _ieltsInfoFourth.bands.speaking.firstpart),
                    Text("Speaking second band: " + _ieltsInfoFourth.bands.speaking.secondpart),

                  ],
                );
              }
            },
          )
      ),
    );
  }
}
