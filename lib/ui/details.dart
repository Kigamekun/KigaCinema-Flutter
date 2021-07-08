
import 'package:flutter/material.dart';


import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

 Future<Detail> fetchDetail(String id) async {
  final response =
      await http.get(Uri.parse("http://192.168.1.57:8000/api/get_detail_cinema/"+id));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var responseJson = jsonDecode(response.body);
    developer.inspect(responseJson["detail"]);
    return Detail.fromJson((responseJson as Map<String, dynamic>)["detail"]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load Detail');
  }
}



class Detail {
  final String id;
  final String title;
  final String country;
  final String price;
  final String on_air;
  final String description;
  final String thumb;

  Detail(
      {required this.id,
      required this.title,
      required this.country,
      required this.price,
      required this.description,
      required this.on_air,
      required this.thumb});

  factory Detail.fromJson(Map<String, dynamic> json) {
    developer.inspect(json);
    return Detail(
      id: json["id"].toString(),
      title: json["title"],
      country: json["country"],
      price: json["price"],
      on_air: json["on_air"],
      description: json["description"],
      thumb: json["thumb"],
    );
  }
}








class Details extends StatelessWidget {
  final String id;

  const Details({ Key? key , required this.id }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
        home:Scaffold(
            backgroundColor: Color.fromRGBO(31, 41, 55, 1),
        appBar: new AppBar(
          title: new Text("Kiga Cinema"),
          centerTitle: true,
          backgroundColor: Colors.blue[700],
        ),
          body : Container(
      child:FutureBuilder<Detail>(
         future: fetchDetail(this.id),
                builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      Detail? detail = snapshot.data;
                      return Container(child: Center(child: Text(detail!.title,style : TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize:40))));
                    }
                return new Center(
                    child: new Column(
                      children: <Widget>[
                        new Padding(padding: new EdgeInsets.all(50.0)),
                        new CircularProgressIndicator(),
                      ],
                    ),
                  );
                },
      ),
      
    ),
        )
    );
  }
}