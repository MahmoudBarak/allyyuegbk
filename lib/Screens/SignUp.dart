import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/categories_cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/products_Cubit.dart';
import 'package:allyyuegbk/Screens/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _phone = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  bool _vis = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _key,
        child: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      }, icon: Icon(Icons.arrow_back_outlined)),
                      Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold,fontSize: 25),
                      )
                    ],
                  ),
                  Image.asset('assets/Images/Logo.png',height: 290,),

                  Container(
                    width: 300,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _name,
                          keyboardType: TextInputType.name,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              labelText: 'Name',
                              suffixIcon: Icon(Icons.person)),
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: _phone,
                          keyboardType: TextInputType.phone,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              labelText: 'Phone',
                              suffixIcon: Icon(Icons.phone)),
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              labelText: 'Email',
                              suffixIcon: Icon(Icons.email)),
                        ),
                        SizedBox(height: 30,),
                        TextFormField(
                          controller: _password,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                              labelText: 'Password',
                              suffixIcon: Icon(Icons.visibility)),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 200,
                          child: TextButton(
                            child: Text('Sign up', style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold)),
                            onPressed: () {
                              BlocProvider.of<CategoriesCubit>(context).getCategories();

                              BlocProvider.of<ProductCubit>(context).getProducts();
                              Navigator.of(context)
                                  .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (_) => Bar(),
                                  ),
                                      (route) => false);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orange),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
