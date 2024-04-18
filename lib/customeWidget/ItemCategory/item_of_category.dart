import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/Show_categories_Cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/Show_categories_State.dart';
import 'package:allyyuegbk/customeWidget/ItemProduct/products.dart';
import 'package:allyyuegbk/customeWidget/Shimmer/shimmerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemOfCategory extends StatefulWidget {
  const ItemOfCategory();

  @override
  State<ItemOfCategory> createState() => _ItemOfCategoryState();
}

class _ItemOfCategoryState extends State<ItemOfCategory> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecificCategoryCubit, specificCategoryState>(
      builder: (context, state) {
        if (state is GetCategorySuccessState) {
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).devicePixelRatio/4.2,
                mainAxisSpacing: MediaQuery.of(context).size.width/40,
                crossAxisSpacing: MediaQuery.of(context).size.width/40),
            itemCount: state.categore.length,
            itemBuilder: (context, index) {
              final model = state.categore[index];
              return Products(model: model);
            },
          );
        }else if (state is GetCategoryFailureState){
          return Center(child: Text('${state.errmessage}'));

        }

        return ShimmerWidget();

      },
    );
  }
}
