import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class Doa extends StatefulWidget {
  @override
  _Doa createState() => _Doa();

}

class _Doa extends State<Doa> {
  String doa = "";

  Future<String> readJson(int flag) async {
    final String response = await rootBundle.loadString('assets/angelus.json');
    final data = await json.decode(response);
    String flagItems = "";
    if (flag == 0) {
      flagItems = "indonesia";
    }else if (flag == 1) {
      flagItems = "latin";
    } else if (flag == 2) {
      flagItems = "inggris";
    } else if (flag == 3) {
      flagItems = "jawa";
    }

    setState(() {
      doa = data[flagItems];
    });


  return 'Succes!';
  }
  @override
  void initState() {
    // TODO: implement initState
    readJson(0);
    super.initState();
  }
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: <Widget>[

            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text(
                'Doa Malaikat Tuhan',
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize : 16
                ),),
            ),
            // Display the data loaded from sample.json
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Text(
                doa.toString(),
                style: TextStyle(
                  fontSize: 15
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: (){
                    readJson(0);
                  },
                  child: Text(
                    'Indonesia',
                    style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                ),),
                ElevatedButton(
                  onPressed: (){
                    readJson(1);
                  },
                  child: Text('Latin',style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                ),),
                ElevatedButton(
                  onPressed: (){
                    readJson(2);
                  },
                  child: Text('Inggris',style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                ),),
                ElevatedButton(onPressed: (){
                  readJson(3);
                },
                child: Text('Jawa',style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                ),),
              ],
            )
          ],
        ),
      )
    );
  }

}