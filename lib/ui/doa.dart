import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class Doa extends StatefulWidget {
  Doa ({required this.flag});

  final int flag;
  @override
  _Doa createState() => _Doa(flag: this.flag);

}

class _Doa extends State<Doa> {
  final int flag;

  _Doa ({required this.flag});
  String judul = "";
  String doa = "";




  Future<String> readJson(int flag) async {
    final String response = await rootBundle.loadString('assets/angelus.json');
    final data = await json.decode(response);
    String flagItems = "";
    print(flag);
    if (flag == 0) {
      flagItems = "indonesia";
    }else if (flag == 1) {
      flagItems = "latin";
    } else if (flag == 2) {
      flagItems = "inggris";
    } else if (flag == 3) {
      flagItems = "jawa";
    } else if (flag == 4) {
      flagItems = "bekerja1";
    } else if (flag == 5) {
      flagItems = "bekerja2";
    }

    setState(() {
      judul = data[flagItems][0]["title"];
      doa = data[flagItems][0]["content"];
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
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
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
                style: TextStyle(
                  fontSize: 16
                ),
              ),
            ),
            SizedBox(height: 40.0),
            flag == 0 ?
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
            : Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: (){
                    readJson(4);
                  },
                  child: Text(
                    'Sebelum Bekerja',
                    style: TextStyle(
                      color: Colors.white
                      ),
                    ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purple,
                ),),
                ElevatedButton(
                  onPressed: (){
                    readJson(5);
                  },
                  child: Text('Sesudah Bekerja',style: TextStyle(
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