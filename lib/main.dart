import 'package:allyyuegbk/Cubits/AppCubit/App_cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/categories_cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/products_Cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/single_product_cubit.dart';
import 'package:allyyuegbk/Screens/Splash.dart';
import 'package:allyyuegbk/Services/dio_helper.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context)=>AppCubit()),
        BlocProvider(create: (context)=>ProductCubit(Network())),
        BlocProvider(create: (context)=>SingleProCubit(Network(),ProductsModel())),
        BlocProvider(create: (context)=>CategoriesCubit (Network())),


      ] ,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),);

  }
}

