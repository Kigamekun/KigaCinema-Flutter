import 'package:flutter/material.dart';
import 'package:kiga_cinema/bloc/Cinema_bloc.dart';
import 'package:kiga_cinema/model/Cinema.dart';
import 'dart:developer' as developer;
import 'package:kiga_cinema/ui/details.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                                              padding : EdgeInsets.all(5),
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.25,
                                              child: Column(
                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 4,
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
                                                      Navigator.push(context, new MaterialPageRoute(
   builder: (context) => new Details(id:post.id))
 );


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