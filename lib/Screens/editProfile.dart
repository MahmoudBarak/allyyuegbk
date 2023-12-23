import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){
          Navigator.pop(context);
        },),
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
                height: 60,
              ),
              _profile(),
              SizedBox(
                height: 50,
              ),
              _save()
            ],
          ),
        ),
      ),
    );
  }
}

Widget _image() {
  return Padding(
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
                icon: Icon(Icons.add_a_photo_rounded),
                onPressed: () {},
              ),
            ),
          ))
    ]),
  );
}

Widget _profile() {
  return Column(
    children: [
      TextFormField(
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelText: 'Name',
            suffixIcon: Icon(Icons.person)),
      ),
      SizedBox(
        height: 30,
      ),
      TextFormField(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelText: 'Email',
            suffixIcon: Icon(Icons.email)),
      ),
      SizedBox(
        height: 30,
      ),
      TextFormField(
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            labelText: 'Phone',
            suffixIcon: Icon(Icons.phone)),
      ),
      SizedBox(
        height: 30,
      ),
      TextFormField(
        keyboardType: TextInputType.streetAddress,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),),
            labelText: 'Address',
            suffixIcon: Icon(Icons.map)),
      ),
    ],
  );
}

Widget _save() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(
        onPressed: () {},
        child: Text(('Save')),
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orangeAccent,
            foregroundColor: Colors.black),
      ),
    ],
  );
}
