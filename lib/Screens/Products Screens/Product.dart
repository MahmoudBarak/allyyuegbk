import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/single_product_cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/single_product_state.dart';
import 'package:allyyuegbk/Screens/Products%20Screens/show_product.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OneProduct extends StatefulWidget {
  const OneProduct({Key? key}) : super(key: key);

  @override
  State<OneProduct> createState() => _OneProductState();
}

class _OneProductState extends State<OneProduct> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: BlocBuilder<SingleProCubit, SingleState>(
            builder: (context, state) {
             if(state is GetSingleProductSuccessState){
                final product=state.oneProduct;

                return Column(
                children: [
                  ShowProducts(product: product,),
                  _button(product)
                ],
                );
              }else if (state is GetSingleProductFailureState) {
                return Text('${state.erorr}');

              }
              return Center(child: CircularProgressIndicator(),);
            },
          ),
        ),
      ),
    );
  }


  Widget _button(ProductsModel product) => Container(

    width: 350,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14),
      color: Colors.orange.shade800,
    ),
    child: TextButton(
      child: Text('Add to cart',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18)),
      onPressed: () {

      },
    ),
  );
}
