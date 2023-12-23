import 'package:allyyuegbk/Cubits/AuthCubit/Auth_state.dart';
import 'package:allyyuegbk/fireBase/auth_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState>{
  AuthCubit(this.auth) : super(AuthInitial());
  Auth auth;


  loginUser(String email,String password)
  async{
    emit(LogInLoading());
    try{
      await auth.signInWithEmailAndPassword(email:email, password: password);

      emit(LogInSuccess());

    }on FirebaseAuthException  catch (e)
    {
      if (e.code == 'user-not-found') {
          emit(LogInFailure(errorMessage: 'user not found'));
        } else if (e.code == 'wrong-password') {
        emit(LogInFailure(errorMessage: 'wrong password'));
        }
    }catch (e){
      emit(LogInFailure(errorMessage: 'something wrong'));
    }

  }
  signUp({required String email, required String password, required String name, required String phone})
  async
  {
    emit(RegisterLoading());
    try{
     await auth.registerWithEmailAndPassword(email: email,password: password,name: name,phone: phone);
     emit(RegisterSuccess());
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
       emit(RegisterFailure(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'The account already exists for that email.'));

      }
    } catch (e) {
      emit(RegisterFailure(errorMessage: 'something wrong'));

    }


  }


}