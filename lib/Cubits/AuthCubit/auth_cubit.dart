import 'package:allyyuegbk/Cubits/AuthCubit/Auth_state.dart';
import 'package:allyyuegbk/fireBase/auth_class.dart';
import 'package:allyyuegbk/models/users.dart';
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
  signUp(Users user ,{ required String password})
  async
  {
    emit(RegisterLoading());
    try{
     await auth.registerWithEmailAndPassword(user,password: password);
     emit(RegisterSuccess());
    }on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
       emit(RegisterFailure(errorMessage: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(RegisterFailure(errorMessage: 'The account already exists for that email.'));

      }
      return emit(RegisterFailure(errorMessage: e.toString()));
    } catch (e) {
      emit(RegisterFailure(errorMessage: 'something wrong'));

    }


  }


}