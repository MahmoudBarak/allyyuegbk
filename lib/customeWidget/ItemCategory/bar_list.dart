import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/Show_categories_Cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/categories_State.dart';
import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/categories_cubit.dart';
import 'package:allyyuegbk/Screens/PageOfCategory.dart';
import 'package:allyyuegbk/customeWidget/Shimmer/shimmer_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BarList extends StatefulWidget {
  const BarList();

  @override
  State<BarList> createState() => _BarListState();
}

class _BarListState extends State<BarList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/18,
      child: BlocBuilder<CategoriesCubit, CategoriesState>(
        builder: (context, state) {
          if (state is GetCategoriesSuccessState) {
            return ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                width: MediaQuery.of(context).size.width/50,
              ),
              itemCount: state.categories.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                String categories = state.categories[index];
                return _bar(categories);
              },
            );
          } else if (state is GetCategoriesFailureState) {
            return Text('${state.errmessage}');
          } else {
            return CustShimmerBar();
          }
        },
      ),
    );
  }
  Widget _bar(String categories) => Container(
    margin: EdgeInsets.all(10),
    height: MediaQuery.of(context).size.height/5,
    width: MediaQuery.of(context).size.width/3,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.orange,
            spreadRadius: 2,
          )
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200),
    child: InkWell(
      onTap: () {
        BlocProvider.of<SpecificCategoryCubit>(context)
            .getCategory(categories);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CategoryPage()));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(categories)],
      ),
    ),
  );
}
