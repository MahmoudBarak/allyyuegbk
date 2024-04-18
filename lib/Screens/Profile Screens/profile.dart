import 'package:allyyuegbk/Screens/Auth%20Screens/LogIn.dart';
import 'package:allyyuegbk/Screens/Profile%20Screens/editProfile.dart';
import 'package:allyyuegbk/fireBase/auth_class.dart';
import 'package:allyyuegbk/main.dart';
import 'package:allyyuegbk/models/users.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Users? user;
  @override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _profile(),
              SizedBox(
                height:  MediaQuery.of(context).size.height/30,
              ),
              _logOut()
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return FutureBuilder<Users?>(
        future: Auth().getUsersData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState== ConnectionState.waiting) {
            return Text('Loading');
          } else if (snapshot.hasData) {
            final user = snapshot.data;
            return Container(
              width: MediaQuery.of(context).size.width/1.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(user!.name),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height:  MediaQuery.of(context).size.height/30,
                  ),
                  Text(user.email),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height:  MediaQuery.of(context).size.height/30,
                  ),
                  Text(user.phone),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height:  MediaQuery.of(context).size.height/30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                          builder: (context) => EditProfile(
                            name: user.name,
                            phone: user.phone,
                            email: user.email,

                          )));

                    },
                    child: Text(('edit Profile')),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.black),
                  ),


                ],
              ),
            );
          }
          return Text("Something Wrong${snapshot.data}");
        });
  }

  Widget _logOut() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: ()async {
            sharedPreferences.clear();
            await Auth().signOut();
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              ),
                  (route) => false,
            );

          },
          child: Text(('Log Out')),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.black),
        ),
      ],
    );
  }
}
