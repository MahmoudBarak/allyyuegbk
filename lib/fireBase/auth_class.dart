import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth
{
  FirebaseAuth auth=FirebaseAuth.instance;
  FirebaseFirestore store=FirebaseFirestore.instance;


  registerWithEmailAndPassword(
      {required String email, required String password, required String name, required String phone})async
  {

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password,);
      addaUserToFireStore(name:name,phone:phone ,email: email);

  }
  void addaUserToFireStore({required String name, required String phone, required String email}) {
    CollectionReference users = store.collection('users');
    users
        .add({
      'name': name,
      'email': email,
      'phone': phone,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
  signInWithEmailAndPassword({required String email, required String password})async
  {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );


  }
}


