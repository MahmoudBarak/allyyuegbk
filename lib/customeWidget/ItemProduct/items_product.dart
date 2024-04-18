import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/product_State.dart';
import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/products_Cubit.dart';
import 'package:allyyuegbk/customeWidget/ItemProduct/products.dart';
import 'package:allyyuegbk/customeWidget/Shimmer/shimmerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsProduct extends StatefulWidget {
  const ItemsProduct();

  @override
  State<ItemsProduct> createState() => _ItemsProductState();
}

class _ItemsProductState extends State<ItemsProduct> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, DataState>(
      builder: (context, state) {
        if (state is GetProductsSuccessState) {
          return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).devicePixelRatio/4.6,
                mainAxisSpacing: MediaQuery.of(context).size.width/40,
                crossAxisSpacing: MediaQuery.of(context).size.width/40),
            itemCount: state.prodcuts.length,
            itemBuilder: (context, index) {
              final model = state.prodcuts[index];

              return Products(model: model);
            },
          );
        } else if (state is GetProductsFailureState) {
          return Text('${state.errmessage}');
        }
        return ShimmerWidget();

      },
    );
  }
}
