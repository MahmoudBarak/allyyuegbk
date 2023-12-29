import 'package:allyyuegbk/Cubits/AppCubit/App_cubit.dart';
import 'package:allyyuegbk/Cubits/AuthCubit/auth_cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/Show_categories_Cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/categories_cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/products_Cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/single_product_cubit.dart';
import 'package:allyyuegbk/Screens/Splash.dart';
import 'package:allyyuegbk/Services/dio_helper.dart';
import 'package:allyyuegbk/fireBase/auth_class.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider(create: (context)=>AuthCubit(Auth())),

        BlocProvider(create: (context)=>ProductCubit(Network())..getProducts()),
        BlocProvider(create: (context)=>SingleProCubit(Network())),
        BlocProvider(create: (context)=>CategoriesCubit (Network())..getCategories()),
        BlocProvider(create: (context)=> SpecificCategoryCubit(Network())),


      ] ,
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ),);

  }
}

