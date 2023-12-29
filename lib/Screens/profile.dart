import 'package:allyyuegbk/Screens/editProfile.dart';
import 'package:allyyuegbk/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {

            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) =>EditProfile() ));
          },
          icon: Icon(
            Icons.edit,
          ),
        ),
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.dark_mode))],
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _image(),
                ],
              ),
              SizedBox(
                height:60,
              ),
              _profile(),
              SizedBox(height: 50,),
              _logOut()


            ],
          ),
        ),
      ),
    );
  }

  Widget _image() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
          backgroundColor: Colors.orangeAccent,
          radius: 50,
          child: Icon(
            Icons.person,
          )),
    );
  }

  Widget _profile() {
    return StreamBuilder<List<Users>>(
      stream: null,
      builder: (context, snapshot) {
        return Container(
          width: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name"),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Email"),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Text("phoneNumber"),
              Divider(
                thickness: 1,
                color: Colors.black,
              ),
              SizedBox(
                height: 10,
              ),
              Text("address"),
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
    );
  }

  Widget _logOut(){
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
