import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/single_product_cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/single_product_state.dart';
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
              if(state is LoadingSingleProductState){
                return Center(child: CircularProgressIndicator(),);

              }else if(state is GetSingleProductSuccessState){
                final product=state.oneProduct;

                return Column(
                children: [
                  _showProduct(product),
                  _descrption(product),
                  _button()
                ],
                );
              }else if (state is GetSingleProductFailureState) {
                return Text('Somthing WR');

              }  else{
                return Text('Check Code');
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _showProduct(ProductsModel product) => Stack(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(400),
                    bottomLeft: Radius.circular(400))),
          ),
          Image.network(product.image!),
          IconButton(
            onPressed: () {

              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_outlined,
            ),
          )
        ],
      );
  Widget _descrption(ProductsModel product) => Container(
        height: 570,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${product.price.toString()!}\$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Rating:  ${product.rating!.rate.toString()!}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),




              ],
            ),

            SizedBox(
              height: 20,
            ),
            Text(
              'About',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              product.description!,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ],
        ),
      );
  Widget _button() => Container(

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
      onPressed: () {},
    ),
  );
}
