import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:imavi_app/ui/doa/doa.dart';
import 'package:http/http.dart' as http;
import 'package:imavi_app/ui/doa/listDoa.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          _headerTemplate(),
          Container(
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> ListDoa()));
                    },
                    child: Text(
                      'Kumpulan Doa',
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                  ),
                )
        ],
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

