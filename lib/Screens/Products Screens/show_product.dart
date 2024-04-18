import 'package:allyyuegbk/models/products_model.dart';
import 'package:flutter/material.dart';

class ShowProducts extends StatelessWidget {
  final ProductsModel product;
   ShowProducts({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Stack(
        children: [
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
      ),
      Container(
        height: MediaQuery.of(context).size.height/1.1,
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
              height: MediaQuery.of(context).size.height/50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${product.price.toString()}\$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Rating:  ${product.rating!.rate.toString()}',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.star,color: Colors.amberAccent,),
                  ],

                ),


              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height/60,
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
      )
    ],);
  }
}
