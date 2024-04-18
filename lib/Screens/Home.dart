import 'package:allyyuegbk/customeWidget/ItemCategory/bar_list.dart';
import 'package:allyyuegbk/customeWidget/ItemProduct/items_product.dart';
import 'package:allyyuegbk/customeWidget/SearchBar/search_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';





class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool love= false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CustSearchBar(isHome: true,),
                SizedBox(
                  height: MediaQuery.of(context).size.height/30,
                ),
                _bannerList(),
                SizedBox(
                  height:  MediaQuery.of(context).size.height/50,
                ),
                BarList(),
                SizedBox(
                  height:  MediaQuery.of(context).size.height/50,
                ),
                ItemsProduct()
              ],
            ),
          ),
        ),
      ),
    );
  }

  final List<Widget> images = [
    Image.asset('assets/Images/Sale.jpg'),
    Image.asset('assets/Images/Soon.jpg'),
  ];
  Widget _bannerList() => CarouselSlider(
      items: images,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ));

}
