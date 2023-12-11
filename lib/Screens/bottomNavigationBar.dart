import 'package:allyyuegbk/Cubits/AppCubit/App_cubit.dart';
import 'package:allyyuegbk/Cubits/AppCubit/App_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: AppCubit.get(context).Screens[AppCubit.get(context).current_index],
            bottomNavigationBar: GNav(
              backgroundColor: Colors.white,
              gap: 8,
              activeColor: Colors.orange,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.orange.shade50,
              color: Colors.grey.shade500,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  textColor: Colors.orange,
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'WishList',
                  textColor: Colors.orange,
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  textColor: Colors.orange,
                ),
              ],
              selectedIndex: AppCubit.get(context).current_index,
              onTabChange: (index) {
                AppCubit.get(context).Changeindex(index);



              },
            ),


          );
        },
      ),
    );
  }
}



