import 'package:allyyuegbk/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth
{
  FirebaseAuth auth=FirebaseAuth.instance;
  FirebaseFirestore store=FirebaseFirestore.instance;



  registerWithEmailAndPassword(
      Users user,{required String password})async
  {

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email, password: password,);
      addaUserToFireStore(user,userCredential.user!.uid);

  }
  void addaUserToFireStore(Users user,String id) {
    CollectionReference users = store.collection('users');
    user.id=id;
    users.add(user.toJson());

  }
  signInWithEmailAndPassword({required String email, required String password})async
  {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );


  }
}


