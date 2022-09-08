import 'package:allyyuegbk/Screens/Product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'Cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                _searhAndCart(),
                SizedBox(
                  height: 15,
                ),
                _bannerList(),
                SizedBox(
                  height: 8,
                ),
                _barList(),
                SizedBox(
                  height: 8,
                ),
                _items()
              ],
            ),
          ),
        ),
      ),
    );
  }
  final List<Widget> images=[
    Image.asset('assets/Images/Sale.jpg'),
    Image.asset( 'assets/Images/Soon.jpg'),

  ];
  Widget _searhAndCart()=> Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10)),
        width: 303,
        child: TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.go,
          decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Find Your Product",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20)),
              prefixIcon: Icon(
                Icons.search_outlined,
                color: Colors.black,
              )),
        ),
      ),
      Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          width: 40,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Cart()));

              },
              icon: Icon(
                Icons.shopping_cart,
              )))
    ],
  );
  Widget _barList() => Container(
        height: 50,
        child: ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _bar(),
            separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
            itemCount: 5),
      );
  Widget _bar() => Container(
        margin: EdgeInsets.all(10),
        height: 30,
        width: 100,
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
          onTap: () {},
          child: Row(
            children: [
              Icon(Icons.image),
              SizedBox(
                width: 6,
              ),
              Text('Watch')
            ],
          ),
        ),
      );
  Widget _items() => GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: .6,
            mainAxisSpacing: 3,
            crossAxisSpacing: 3),
        itemCount: 20,
        itemBuilder: (context, index) {
          return _products();
        },
      );
  Widget _products() => InkWell(
        borderRadius: BorderRadius.circular(19),
        highlightColor: Colors.orange,
        splashColor: Colors.orange,
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Product()));
        },
        child: Container(
          margin: EdgeInsets.all(4),
          height: 300,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Images/shooe_tilt_1.png',
                    height: 200,
                  ),
                  Container(
                    height: 68,
                    width: 195,
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nike Shoes',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '100\$',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      );
  Widget _bannerList() => CarouselSlider(
          items:images,
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,

          )
      );
}