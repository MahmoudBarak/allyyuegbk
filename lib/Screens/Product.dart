import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              _showProduct(),
              _descrption(),

              _button()


            ],
          ),
        ),
      ),
    );
  }

  final List _productImages = [
    'assets/Images/show_1.png',
    'assets/Images/shooe_tilt_1.png'
  ];

  Widget _showProduct() => Stack(
    children: [

      Container(
        height:300,
        decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(400),
                bottomLeft: Radius.circular(400))),

      ),
      CarouselSlider(
        items: _productImages
            .map((e) => Builder(
          builder: (context) {
            return Container(
              margin: EdgeInsets.only(top: 25),
              height: 100,
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(e),
                ],
              ),
            );
          },
        ))
            .toList(),
        options: CarouselOptions(
          autoPlay: true,
          viewportFraction: 1.0,
          height: 250,
          aspectRatio: 1.0,
          scrollDirection: Axis.horizontal,
          enlargeCenterPage: true,
        ),
      ),
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
  Widget _descrption() => Container(
    height: 440,

        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nike Shoes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Icon(
                  Icons.star_border_purple500_sharp,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '100\$',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
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
              'Nike Shoes Wonderful and Trendy',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Row(
              children: [
               _sizeList()
              ],
            )
          ],
        ),
      );
  Widget _sizeList()=> Container(
    padding: EdgeInsets.only(left: 9),
    height: 50,
    child: ListView.separated(
      shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => _size('40'),
        separatorBuilder: (context, index) => SizedBox(
          width:20,
        ),
        itemCount: 5),
  );
  Widget _size(String size) => Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 1
                )
              ],
                borderRadius: BorderRadius.circular(15),
                color: Colors.white),
          ),
          Text(size,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
        ],
      );
  Widget _button()=> Column(
    children: [
      Container(
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.orange.shade800,
        ),
        child: TextButton(
          child: Text('Add to cart', style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold,fontSize: 18)),
          onPressed: () {

          },

        ),
      ),
    ],
  );

}
