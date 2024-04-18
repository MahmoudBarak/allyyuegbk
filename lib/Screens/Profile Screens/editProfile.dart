import 'package:allyyuegbk/Screens/bottomNavigationBar.dart';
import 'package:allyyuegbk/fireBase/auth_class.dart';
import 'package:allyyuegbk/models/users.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  final String? name;
  final String? phone;
 final  String? email;

  EditProfile(
      { this.name,
      this.phone,
      this.email,
      Key? key})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  @override
  void initState() {
    _name.text = widget.name!;
    _phone.text = widget.phone!;
    _email.text = widget.email!;
    super.initState();
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
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height/5,
              ),
              _profile(),
              SizedBox(
                height: MediaQuery.of(context).size.height/10,
              ),
              _save()
            ],
          ),
        ),
      ),
    );
  }



  TextEditingController _email = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();

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
            height: MediaQuery.of(context).size.height/30,
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
            height: MediaQuery.of(context).size.height/30,
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
            height: MediaQuery.of(context).size.height/30,
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
                );
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
