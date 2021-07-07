// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'dart:developer' as developer;


// class Cinema {
//   String id;
//   String title;
//   String country;
//   String price;
  
//  String description;
//  String thumb;

//   Cinema({ required this.id , required this.title ,required this.country ,required this.price ,required this.description,required this.thumb});

//   factory Cinema.createCinema(Map<String, dynamic> object){
//     return Cinema(
//       id: object["id"].toString(),
//       title:object["title"],
//       country: object["country"],
//       price: object["price"],
      
//   description: object["description"],
//   thumb: object["thumb"],

//     );
//   }
//   static Future<Cinema> getCinemaFromAPI() async {
//       developer.log('cinemaData');
//       var apiURL = Uri.parse("http://10.0.2.2:8000/api/get_cinema");
//       var apiResult = await http.get(apiURL);
//       var jsonObject = json.decode(apiResult.body);
//       var cinemaData = (jsonObject as Map<String, dynamic>)['data'];
//   return Cinema.createCinema(cinemaData);


//   }


// }


// class UninitializedCinema extends Cinema{}



