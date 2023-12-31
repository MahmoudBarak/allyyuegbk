import 'package:allyyuegbk/models/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth
{
  FirebaseAuth auth=FirebaseAuth.instance;
  FirebaseFirestore stor=FirebaseFirestore.instance;



  registerWithEmailAndPassword(
      Users user,{required String password})async
  {

      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: user.email, password: password,);
      addaUserToFireStore(user,userCredential.user!.uid);
      print(user.docId);

  }
  void addaUserToFireStore(Users user,String id) {
    final users = stor.collection('users').doc(id);


    user.id=id;
    user.docId=users.id;
    users.set(user.toJson());

  }
  signInWithEmailAndPassword({required String email, required String password})async
  {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );


  }


  Future<Users?> getUsersData()
 async {

    final getDoc =  stor.collection('users').doc(auth.currentUser!.uid);
    final date=await getDoc.get();
    return Users.fromJson(date.data()!);


  }


  void updateData(Users us)

  {
    final getDoc= stor.collection('users').doc(auth.currentUser!.uid);
    getDoc.update({
      'name':us.name ,
      'address':us.address,
      'phone':us.phone,
      'email':us.email,

    });


  }

}


