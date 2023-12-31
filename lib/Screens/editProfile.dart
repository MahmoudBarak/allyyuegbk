import 'package:allyyuegbk/Screens/bottomNavigationBar.dart';
import 'package:allyyuegbk/fireBase/auth_class.dart';
import 'package:allyyuegbk/models/users.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  String name;
  String phone;
  String email;
  String address;
  EditProfile(
      {required this.name,
      required this.phone,
      required this.email,
      required this.address,
      Key? key})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    _name.text = widget.name;
    _phone.text = widget.phone;
    _email.text = widget.email;
    _address.text = widget.address;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
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

  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();

  TextEditingController _address = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();

  Widget _profile() {
    return Form(
      key: _key,
      child: Column(
        children: [
          TextFormField(
            controller: _name,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Name',
                suffixIcon: Icon(Icons.person)),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Email',
                suffixIcon: Icon(Icons.email)),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _phone,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Phone',
                suffixIcon: Icon(Icons.phone)),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _address,
            keyboardType: TextInputType.streetAddress,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText: 'Address',
                suffixIcon: Icon(Icons.map)),
          ),
        ],
      ),
    );
  }
  Widget _save() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            final user = Users(
                name: _name.text,
                email: _email.text,
                phone: _phone.text,
                address: _address.text);
            Auth().updateData(user);

            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (_) => Bar(),
                ),
                    (route) => false);
          },
          child: Text(('Save')),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              foregroundColor: Colors.black),
        ),
      ],
    );
  }
}



