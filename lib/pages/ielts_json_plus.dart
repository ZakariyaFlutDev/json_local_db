import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_local_db/model/json_beginner_plus.dart';
class IeltsJsonPlusPage extends StatefulWidget {
  const IeltsJsonPlusPage({Key? key}) : super(key: key);

  @override
  _IeltsJsonPlusPageState createState() => _IeltsJsonPlusPageState();
}

class _IeltsJsonPlusPageState extends State<IeltsJsonPlusPage> {
  late IeltsInfoPlus _ieltsInfoPlus;

  @override
  void initState() {
    getDataFromLocal().then((value){
      _ieltsInfoPlus = value;
    });
  }

  Future<IeltsInfoPlus> getDataFromLocal()async{
    var data = await rootBundle.loadString("assets/ielts_plus.json");
    Map<String,dynamic> mapData = jsonDecode(data);
    return IeltsInfoPlus.fromJson(mapData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ielts Info"),
      ),
      body: Center(
          child: FutureBuilder<IeltsInfoPlus>(
            future: getDataFromLocal(),
            builder: (ctx, snapshot){
              if(snapshot.data == null){
                return Text("Data not found");
              }
              else{
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ID: " + _ieltsInfoPlus.id.toString(), style: TextStyle(fontSize: 16),),
                    SizedBox(height: 20,),
                    Text("Name: "+_ieltsInfoPlus.name, style: TextStyle(fontSize: 30),),
                    SizedBox(height: 20,),
                    Text("Band: "+_ieltsInfoPlus.band.toString(), style: TextStyle(fontSize: 22),),
                    SizedBox(height: 50,),
                    Text("Reading band: " + _ieltsInfoPlus.bands[0]),
                    Text("Writing band: " + _ieltsInfoPlus.bands[1]),
                    Text("Listening band: " + _ieltsInfoPlus.bands[2]),
                    Text("Speaking band: " + _ieltsInfoPlus.bands[3]),

                  ],
                );
              }
            },
          )
      ),
    );
  }
}
