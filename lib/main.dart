import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

Future<List<Album>> fetchAlbum() async {
  final response =
      await http.get(Uri.parse("http://192.168.1.57:8000/api/get_cinema"));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var responseJson = jsonDecode(response.body);
    return (responseJson['cinema'] as List)
        .map((p) => Album.fromJson(p))
        .toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String id;
  final String title;
  final String country;
  final String price;
  final String on_air;
  final String description;
  final String thumb;

  Album(
      {required this.id,
      required this.title,
      required this.country,
      required this.price,
      required this.description,
      required this.on_air,
      required this.thumb});

  factory Album.fromJson(Map<String, dynamic> json) {
    developer.inspect(json);
    return Album(
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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(31, 41, 55, 1),
        appBar: new AppBar(
          title: new Text("Kiga Cinema"),
          centerTitle: true,
          backgroundColor: Colors.blue[700],
        ),
        body: new Container(
          margin: EdgeInsets.only(top: 20),
          child: new ListView(
            children: <Widget>[
              Center(
                  child: Text(
                "Movie",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )),
              new FutureBuilder<List<Album>>(
                future: fetchAlbum(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Album>? albums = snapshot.data;
                    return new Column(
                        children: albums!
                            .map((post) => new Column(
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 170,
                                      margin: EdgeInsets.all(5),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              // child: FittedBox(
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),bottomLeft: Radius.circular(10)),
                                                  child: Image.network(
                                                      'http://192.168.1.57:8000/thumb_mov/' +
                                                          post.thumb,
                                                          fit:BoxFit.fill
                                                          
                                                          ),
                                                          
                                                ),
                                                // fit: BoxFit.fill,
                                              // ),
                                              decoration: BoxDecoration(
                                                  color: Color.fromRGBO(
                                                      17, 24, 39, 1),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    post.title,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                    Text(
                                                      
                                                    post.description,
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                        
                                                        color: Colors.white),
                                                  ),
                                                   Text(
                                                      
                                                    post.on_air,
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                        
                                                        color: Colors.white),
                                                  ),
                                                
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.purple[
                                                          400], // background
                                                      onPrimary: Colors
                                                          .white, // foreground
                                                    ),
                                                    onPressed: () {
                                                      developer.log('In Click');
                                                    },
                                                    child: Text('Order'),
                                                  )
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10)),
                                                // border: Border.all(color: Colors.blueAccent),
                                                color: Color.fromRGBO(
                                                    17, 24, 39, 1),
                                                // borderRadius: BorderRadius.all(Radius.circular(10),)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ))
                            .toList());
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
            ],
          ),
        ),
      ),
    );
  }
}


// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late Future<Album> futureAlbum;

//   @override
//   void initState() {
//     super.initState();
//     futureAlbum = fetchAlbum();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fetch Data Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Fetch Data Example'),
//         ),
//         body: Center(
//           child: FutureBuilder<Album>(
//             future: futureAlbum,
//             builder: (context, snapshot) {
//               developer.inspect(snapshot);
//               if (snapshot.hasData) {
//                 return Text(snapshot.data!.title.toString());
//               } else if (snapshot.hasError) {
//                 return Text("${snapshot.error}");
//               }

//               // By default, show a loading spinner.
//               return CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }