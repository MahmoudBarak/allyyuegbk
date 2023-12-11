import 'package:allyyuegbk/Cubits/DataCubit/data_Cubit.dart';
import 'package:allyyuegbk/Screens/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottomNavigationBar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
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
                      Text(
                        'Log in',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      )
                    ],
                  ),
                  Image.asset(
                    'assets/Images/Logo.png',
                    height: 300,
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 300,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _email,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Email',
                              suffixIcon: Icon(Icons.email)),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: _password,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelText: 'Password',
                              suffixIcon: Icon(Icons.visibility)),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          width: 200,
                          child: TextButton(
                            child: Text('Log in',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {

                               BlocProvider.of<DataCubit>(context).getData();





                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (_) => Bar(),
                                  ),
                                  (route) => false);
                            },
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.orange),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          color: Colors.black,
                        ),
                        Column(
                          children: [
                            Text('Don’t Have Account?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                                },
                                child: Text('Sign Up',
                                    style: TextStyle(
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold)))
                          ],
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
