import 'package:allyyuegbk/Cubits/AuthCubit/Auth_state.dart';
import 'package:allyyuegbk/Cubits/AuthCubit/auth_cubit.dart';
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
  bool validateForm() {
    final form = _key.currentState;
    return form!.validate() ? true : false;
  }

  bool _vis = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LogInSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => Bar(),
              ),
              (route) => false);
        } else if (state is LogInFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.errorMessage),
            backgroundColor: Colors.red,
          ));
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Form(
            key: _key,
            child: SafeArea(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
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
                                validator: (email) => email!.isEmpty
                                    ? "email can\‘t  be Empty"
                                    : null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelText: 'Email',
                                    suffixIcon: Icon(Icons.email)),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                onTap: () {
                                  setState(() {
                                    _vis = !_vis;
                                  });
                                },
                                obscureText: _vis,
                                controller: _password,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                validator: (password) => password!.isEmpty
                                    ? "password can\‘t  be Empty"
                                    : null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelText: 'Password',
                                    suffixIcon: _vis
                                        ? Icon(Icons.visibility_off)
                                        : Icon(Icons.visibility)),
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
                                    if (validateForm()) {
                                      BlocProvider.of<AuthCubit>(context)
                                          .loginUser(_email.text.toString(),
                                              _password.text.toString());
                                    }
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
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen()));
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
          ),
        );
      },
    );
  }
}
