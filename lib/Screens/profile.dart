import 'package:allyyuegbk/Screens/editProfile.dart';
import 'package:allyyuegbk/fireBase/auth_class.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode))],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              _profile(),
              SizedBox(
                height: 50,
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
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(children: [
                          CircleAvatar(
                              backgroundColor: Colors.orangeAccent,
                              radius: 50,
                              child: Icon(
                                Icons.person,
                              )),
                          Positioned(
                              bottom: 0,
                              right: 4,
                              child: CircleAvatar(
                                radius: 22,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  backgroundColor: Colors.orangeAccent,
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => EditProfile(
                                                    name: user!.name,
                                                    phone: user.phone,
                                                    email: user.email,
                                                    address: user.address,
                                                  )));
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                    ),
                                  ),
                                ),
                              ))
                        ]),
                      )
                    ],
                  ),
                  Text(user!.name),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(user.email),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(user.phone),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(user.address),
                  Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 10,
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
          onPressed: () {},
          child: Text(('Log Out')),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.black),
        ),
      ],
    );
  }
}
