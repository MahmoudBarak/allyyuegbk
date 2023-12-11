

import 'package:allyyuegbk/Cubits/AppCubit/App_state.dart';
import 'package:allyyuegbk/Screens/Home.dart';
import 'package:allyyuegbk/Screens/profile.dart';
import 'package:allyyuegbk/Screens/wisheList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState>{
  AppCubit() : super(IntialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int current_index=0;
  List <Widget> Screens=[
    HomeScreen(),
    WishList(),
    Profile(),

  ];
 void Changeindex(int index){
   current_index=index;
       emit(ChangeNavBar());

  }


}