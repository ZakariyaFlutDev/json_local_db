import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_local_db/model/json_beginner_plus.dart';
import 'package:json_local_db/model/json_third.dart';
class IeltsJsonThird extends StatefulWidget {
  const IeltsJsonThird({Key? key}) : super(key: key);

  @override
  _IeltsJsonThirdState createState() => _IeltsJsonThirdState();
}

class _IeltsJsonThirdState extends State<IeltsJsonThird> {
  late IeltsInfoThird _ieltsInfoThird;

  @override
  void initState() {
    getDataFromLocal().then((value){
      _ieltsInfoThird = value;
    });
  }

  Future<IeltsInfoThird> getDataFromLocal()async{
    var data = await rootBundle.loadString("assets/ielts_third.json");
    Map<String,dynamic> mapData = jsonDecode(data);
    return IeltsInfoThird.fromJson(mapData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ielts Info"),
      ),
      body: Center(
          child: FutureBuilder<IeltsInfoThird>(
            future: getDataFromLocal(),
            builder: (ctx, snapshot){
              if(snapshot.data == null){
                return Text("Data not found");
              }
              else{
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ID: " + _ieltsInfoThird.id.toString(), style: TextStyle(fontSize: 16),),
                    SizedBox(height: 20,),
                    Text("Name: "+_ieltsInfoThird.name, style: TextStyle(fontSize: 30),),
                    SizedBox(height: 20,),
                    Text("Band: "+_ieltsInfoThird.band.toString(), style: TextStyle(fontSize: 22),),
                    SizedBox(height: 50,),
                    Text("Reading band: " + _ieltsInfoThird.bands.reading),
                    Text("Writing band: " + _ieltsInfoThird.bands.writing),
                    Text("Listening band: " + _ieltsInfoThird.bands.listening),
                    Text("Speaking band: " + _ieltsInfoThird.bands.speaking),

                  ],
                );
              }
            },
          )
      ),
    );
  }
}
