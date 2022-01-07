import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imavi_app/ui/doa/doa.dart';
import 'package:http/http.dart' as http;

class ListDoa extends StatefulWidget {
  @override
  _ListDoaState createState() => _ListDoaState();
}

class _ListDoaState extends State<ListDoa> {
  List _prays = [];
  Future<void> getPrayerData() async {
    var url = Uri.parse('https://61d7aed935f71e0017c2ebc8.mockapi.io/api/v1/listPrayer');
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    setState(() {
      _prays = jsonData;
    });

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrayerData();
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getPrayerData,
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.purple, title: Text('Kumpulan Doa'),),
        body: Column(
        children: <Widget>[
          _prays.isNotEmpty
          ?Expanded(child: ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _prays.length,
      itemBuilder: (context, index) {
                    return Container(
                  width: 200,
                  height: 45,
                  margin: EdgeInsets.only(top: 20),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color(0xffF18265),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> Doa(flag: 0)));
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Doa(flag:_prays[index]['id'])));
                    },
                    child: Text(
                      _prays[index]['title'],
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                );
                  },
    ))
          :Expanded(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        ],
      )
  ,
      )
        );
  }

  Container _headerTemplate() {
    return Container(
              height: 200,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(240),
                      ),
                      gradient: LinearGradient(
                        colors: [Colors.purple, Colors.orange]
                      )
                    ),
                  ),
                  Container(
                    margin : const EdgeInsets.only(top: 60, left: 40),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Institutum Theologicum \nIoannis Mariae Vianney \nSurabayanum',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700
                        ),)
                      ],
                    ),
                  )
                ],
              ),
            );

  }
    // TODO: implement build
  //   return Scaffold(
  //     appBar: new AppBar(
  //       title : Text("Imavi Apps" , style: TextStyle(color: Colors.white)),
  //       backgroundColor: Colors.purple,
  //     ),
  //     body:
  //         Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               Container(
  //                 width: 200,
  //                 height: 45,
  //                 child: TextButton(
  //                   style: TextButton.styleFrom(
  //                     backgroundColor: Color(0xffF18265),
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(20),
  //                     ),
  //                   ),
  //                   onPressed: () {},
  //                   child: Text(
  //                     "Doa Bekerja",
  //                     style: TextStyle(
  //                       color: Color(0xffffffff),
  //                     ),
  //                   ),
  //                 ),
  //               ),

  //               Container(
  //                 margin: EdgeInsets.all(10),
  //                 width: 200,
  //                 height: 45,
  //                 child: TextButton(
  //                   style: TextButton.styleFrom(
  //                     backgroundColor: Color(0xffF18265),
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(20),
  //                     ),
  //                   ),
  //                   onPressed: () {},
  //                   child: Text(
  //                     "Doa Angelus",
  //                     style: TextStyle(
  //                       color: Color(0xffffffff),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //   );
  // }

}

class Pray {
  final String title, content;
  Pray(this.title, this.content);
}