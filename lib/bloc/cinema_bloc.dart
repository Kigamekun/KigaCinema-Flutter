// import 'package:bloc/bloc.dart';
// import 'package:kiga_cinema/model/cinema.dart';
// import 'dart:developer' as developer;
// class CinemaBloc extends Bloc<int,Cinema>{

//   @override

//   CinemaBloc(Cinema initialState) : super(uninitializedCinema());
//   // TODO: implement initialState
//   // Cinema get initialState => uninitializedCinema();

//   Stream<Cinema> mapEventToState(int event) async* {
//     try {
 
//         Cinema cinema = await Cinema.getCinemaFromAPI();
//         developer.log("lewat sini ternyata");
        
//         yield cinema;
//     }catch(e){
//       developer.log(e.toString());
//     }
    


//   }

// }