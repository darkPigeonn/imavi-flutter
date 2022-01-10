import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

class Doa extends StatefulWidget {
  Doa ({required this.flag});

  final String flag;
  @override
  _Doa createState() => _Doa(flag: this.flag);

}

class _Doa extends State<Doa> {
  final String flag;

  _Doa ({required this.flag});
  String judul = "";
  String doa = "";




  Future<String> readJson(String flag) async {
    // final String response = await rootBundle.loadString('assets/angelus.json');
    // final data = await json.decode(response);
    // String flagItems = "";
    // print(flag);
    // if (flag == 0) {
    //   flagItems = "indonesia";
    // }else if (flag == 1) {
    //   flagItems = "latin";
    // } else if (flag == 2) {
    //   flagItems = "inggris";
    // } else if (flag == 3) {
    //   flagItems = "jawa";
    // } else if (flag == 4) {
    //   flagItems = "bekerja1";
    // } else if (flag == 5) {
    //   flagItems = "bekerja2";
    // }

    //api
    var url = Uri.parse('https://61d7aed935f71e0017c2ebc8.mockapi.io/api/v1/listPrayer/'+flag);
    print(url);
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    print(jsonData);
    setState(() {
      judul = jsonData["title"];
      doa =jsonData["content"];
    });


  return 'Succes!';
  }
  @override
  void initState() {
    // TODO: implement initState
    readJson(flag);
    super.initState();
  }
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage("bgdoa.png"), fit: BoxFit.fill)),
          ),
        SingleChildScrollView(
        padding: const EdgeInsets.all(8),

        child: new Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                judul,
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize : 18
                ),),
            ),
            // Display the data loaded from sample.json
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                doa.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  letterSpacing: 2,
                  wordSpacing: 10,
                  fontSize: 16,
                  height: 1.5

                ),
              ),
            ),
            SizedBox(height: 40.0),
          ],
        ),
      )
        ],
      )


    );
  }

}