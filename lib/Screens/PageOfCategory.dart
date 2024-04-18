import 'package:allyyuegbk/customeWidget/ItemCategory/item_of_category.dart';
import 'package:allyyuegbk/customeWidget/SearchBar/search_bar.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState ();
}

class _CategoryPageState extends State<CategoryPage> {

  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.white,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: CustSearchBar(isHome: false ,),
              ),
              Column(children: [ItemOfCategory(),],),
          
            ],
          ),
        ),
      ) ,

    );
  }




}





