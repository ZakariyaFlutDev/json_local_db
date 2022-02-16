import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_local_db/model/json_beginner.dart';
class IeltsJsonPage extends StatefulWidget {
  const IeltsJsonPage({Key? key}) : super(key: key);

  static const String id = "ielts_json_page";

  @override
  _IeltsJsonPageState createState() => _IeltsJsonPageState();
}

class _IeltsJsonPageState extends State<IeltsJsonPage> {
  late IeltsInfo _ieltsInfo;

  @override
  void initState() {
    getDataFromLocal().then((value){
      _ieltsInfo = value;
    });
  }

  Future<IeltsInfo> getDataFromLocal()async{
    var data = await rootBundle.loadString("assets/ielts.json");
    Map<String,dynamic> mapData = jsonDecode(data);
    return IeltsInfo.fromJson(mapData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ielts Info"),
      ),
      body: Center(
        child: FutureBuilder<IeltsInfo>(
          future: getDataFromLocal(),
          builder: (ctx, snapshot){
            if(snapshot.data == null){
              return Text("Data not found");
            }
            else{
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("ID: " + _ieltsInfo.id.toString(), style: TextStyle(fontSize: 16),),
                  SizedBox(height: 20,),
                  Text("Name: "+_ieltsInfo.name, style: TextStyle(fontSize: 30),),
                  SizedBox(height: 20,),
                  Text("Band: "+_ieltsInfo.band.toString(), style: TextStyle(fontSize: 22),),

                ],
              );
            }
          },
        )
      ),
    );
  }
}
