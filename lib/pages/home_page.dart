import 'package:flutter/material.dart';
import 'package:json_local_db/model/json_third.dart';
import 'package:json_local_db/pages/ielts_json.dart';
import 'package:json_local_db/pages/ielts_json_fourth.dart';
import 'package:json_local_db/pages/ielts_json_plus.dart';
import 'package:json_local_db/pages/ielts_json_third.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jsons"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => IeltsJsonPage())),
                child: Text("Ielts Info Json")),
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => IeltsJsonPlusPage())),
                child: Text("Ielts Info Plus Json")),
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => IeltsJsonThird())),
                child: Text("Ielts Info Third Json   Nested Json")),
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => IeltsJsonFourth())),
                child: Text("Ielts Info Fourth Json"))
          ],
        ),
      ),
    );
  }
}
