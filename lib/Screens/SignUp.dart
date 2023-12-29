import 'package:allyyuegbk/Cubits/AuthCubit/Auth_state.dart';
import 'package:allyyuegbk/Cubits/AuthCubit/auth_cubit.dart';
import 'package:allyyuegbk/Screens/bottomNavigationBar.dart';
import 'package:allyyuegbk/models/users.dart';
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

  TextEditingController _address = TextEditingController();
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
        if (state is RegisterSuccess) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => Bar(),
              ),
              (route) => false);
        } else if (state is RegisterFailure) {
         ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(state.errorMessage),backgroundColor: Colors.red,));
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
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_back_outlined)),
                            Text(
                              'Sign up',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            )
                          ],
                        ),
                        Image.asset(
                          'assets/Images/Logo.png',
                          height: 240,
                        ),
                        Container(
                          width: 300,
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _name,
                                keyboardType: TextInputType.name,
                                textInputAction: TextInputAction.next,
                                validator: (name) => name!.isEmpty
                                    ? "name can\‘t  be Empty"
                                    : null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelText: 'Name',
                                    suffixIcon: Icon(Icons.person)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _phone,
                                keyboardType: TextInputType.phone,
                                textInputAction: TextInputAction.next,
                                validator: (phone) => phone!.isEmpty
                                    ? "phone can\‘t  be Empty"
                                    : null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelText: 'Phone',
                                    suffixIcon: Icon(Icons.phone)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
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
                                height: 20,
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
                                textInputAction: TextInputAction.next,
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
                                height: 20,
                              ),
                              TextFormField(
                                onTap: () {
                                  setState(() {});
                                },
                                controller: _address,
                                keyboardType: TextInputType.streetAddress,
                                textInputAction: TextInputAction.done,
                                validator: (address) => address!.isEmpty
                                    ? "Address can\‘t  be Empty"
                                    : null,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    labelText: 'Address',
                                    suffixIcon: Icon(Icons.map)),
                              ),
                              SizedBox(
                                height: 180,
                              ),
                              Container(
                                width: 200,
                                child: TextButton(
                                  child: Text('Sign up',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    if (validateForm()) {
                                      final user=Users( name:_name.text, email: _email.text, phone: _phone.text, address: _address.text);
                                      BlocProvider.of<AuthCubit>(context)
                                          .signUp(user,

                                              password: _password.text.toString(),

                                              );
                                    }
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
          ),
        );
      },
    );
  }
}
