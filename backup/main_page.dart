// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kiga_cinema/bloc/cinema_bloc.dart';
// import 'package:kiga_cinema/model/cinema.dart';
// import 'package:kiga_cinema/ui/home.dart';
// import 'dart:developer' as developer;
// class MainPage extends StatelessWidget {
//   final Random random = Random();
//   @override
//   Widget build(BuildContext context) {
//     CinemaBloc bloc = BlocProvider.of<CinemaBloc>(context);
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.amber,
//         title: Text("Kiga Cinemas"),
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//            	ElevatedButton(
//             child: Text('pick random cinema'),
//             onPressed: () {developer.log("ada");bloc.add(random.nextInt(10) + 1);},
//           ),
//           StreamBuilder<Object>(
//               stream: null,
//               builder: (context, snapshot) {
//                 return BlocBuilder<CinemaBloc, Cinema>(
//                     builder: (context, cinema) => (cinema is uninitializedCinema) ? Container() : Home(cinema));
//               })
//         ],
//       ),
//     );

//     // return Scaffold(
//     //   backgroundColor: Color.fromARGB(0,229,231,235),
//     //   appBar: AppBar(
//     //     backgroundColor: Colors.blue[900],
//     //     title: Text('KigaCin'),
//     //   ),
//     //   body: 
      
//     //   SingleChildScrollView(

//     //     child: Column(children: [

//     //       Card(
//     //       clipBehavior: Clip.antiAlias,
//     //       child: Column(
//     //         children: [
//     //           ListTile(
                
//     //             title: const Text('Card title 1'),
//     //             subtitle: Text(
//     //               'Secondary Text',
//     //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
//     //             ),
//     //           ),
//     //           Padding(
//     //             padding: const EdgeInsets.all(16.0),
//     //             child: Text(
//     //               'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
//     //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
//     //             ),
//     //           ),
//     //           ButtonBar(
//     //             alignment: MainAxisAlignment.start,
//     //             children: [
//     //               FlatButton(
//     //                 textColor: const Color(0xFF6200EE),
//     //                 onPressed: () {
//     //                   // Perform some action
//     //                 },
//     //                 child: const Text('ACTION 1'),
//     //               ),
//     //               FlatButton(
//     //                 textColor: const Color(0xFF6200EE),
//     //                 onPressed: () {
//     //                   // Perform some action
//     //                 },
//     //                 child: const Text('ACTION 2'),
//     //               ),
//     //             ],
//     //           ),
//     //           Image.asset('assets/card-sample-image.jpg'),
//     //           Image.asset('assets/card-sample-image-2.jpg'),
//     //         ],
//     //       ),
//     //     ),
//     //     Card(
//     //       clipBehavior: Clip.antiAlias,
//     //       child: Column(
//     //         children: [
//     //           ListTile(
//     //             leading: Icon(Icons.arrow_drop_down_circle),
//     //             title: const Text('Card title 1'),
//     //             subtitle: Text(
//     //               'Secondary Text',
//     //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
//     //             ),
//     //           ),
//     //           Padding(
//     //             padding: const EdgeInsets.all(16.0),
//     //             child: Text(
//     //               'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
//     //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
//     //             ),
//     //           ),
//     //           ButtonBar(
//     //             alignment: MainAxisAlignment.start,
//     //             children: [
//     //               FlatButton(
//     //                 textColor: const Color(0xFF6200EE),
//     //                 onPressed: () {
//     //                   // Perform some action
//     //                 },
//     //                 child: const Text('ACTION 1'),
//     //               ),
//     //               FlatButton(
//     //                 textColor: const Color(0xFF6200EE),
//     //                 onPressed: () {
//     //                   // Perform some action
//     //                 },
//     //                 child: const Text('ACTION 2'),
//     //               ),
//     //             ],
//     //           ),
//     //           Image.asset('assets/card-sample-image.jpg'),
//     //           Image.asset('assets/card-sample-image-2.jpg'),
//     //         ],
//     //       ),
//     //     ),

//     //     Card(
//     //       clipBehavior: Clip.antiAlias,
//     //       child: Column(
//     //         children: [
//     //           ListTile(
//     //             leading: Icon(Icons.arrow_drop_down_circle),
//     //             title: const Text('Card title 1'),
//     //             subtitle: Text(
//     //               'Secondary Text',
//     //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
//     //             ),
//     //           ),
//     //           Padding(
//     //             padding: const EdgeInsets.all(16.0),
//     //             child: Text(
//     //               'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
//     //               style: TextStyle(color: Colors.black.withOpacity(0.6)),
//     //             ),
//     //           ),
//     //           ButtonBar(
//     //             alignment: MainAxisAlignment.start,
//     //             children: [
//     //               FlatButton(
//     //                 textColor: const Color(0xFF6200EE),
//     //                 onPressed: () {
//     //                   // Perform some action
//     //                 },
//     //                 child: const Text('ACTION 1'),
//     //               ),
//     //               FlatButton(
//     //                 textColor: const Color(0xFF6200EE),
//     //                 onPressed: () {
//     //                   // Perform some action
//     //                 },
//     //                 child: const Text('ACTION 2'),
//     //               ),
//     //             ],
//     //           ),
//     //           Image.asset('assets/card-sample-image.jpg'),
//     //           Image.asset('assets/card-sample-image-2.jpg'),
//     //         ],
//     //       ),
//     //     ),


//     //     ],),
//     //   )
//     // );
//   }
// }
