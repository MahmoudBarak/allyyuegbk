import 'package:allyyuegbk/Cubits/DataCubit/categories_State.dart';
import 'package:allyyuegbk/Cubits/DataCubit/categories_cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/products_Cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/product_State.dart';
import 'package:allyyuegbk/Cubits/DataCubit/single_product_cubit.dart';
import 'package:allyyuegbk/Screens/Product.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                _searchAndCart(),
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

  final List<Widget> images = [
    Image.asset('assets/Images/Sale.jpg'),
    Image.asset('assets/Images/Soon.jpg'),
  ];
  Widget _searchAndCart() => Row(
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
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Cart()));
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                  )))
        ],
      );
  Widget _barList() => Container(
    height: 50,
    child: BlocBuilder<CategoriesCubit , CategoriesState>(
          builder: (context, state) {
            if (state is LoadingCategoriesState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetCategoriesSuccessState) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: 5,
                ),
                itemCount:
                    BlocProvider.of<CategoriesCubit>(context).categories.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  String categories =
                      BlocProvider.of<CategoriesCubit>(context).categories[index];
                  return _bar(categories);
                },
              );
            } else if (state is GetCategoriesFailureState) {
              return Text('${state.errmessage}');
            } else {
              print(BlocProvider.of<CategoriesCubit>(context).categories);
              return Text('${state.toString()}');
            }
          },
        ),
  );
  Widget _bar(String categories) => Container(
        margin: EdgeInsets.all(10),
        height: 40,
        width: 130,
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(categories)],
          ),
        ),
      );
  Widget _items() => BlocBuilder<ProductCubit, DataState>(
        builder: (context, state) {
          if (state is LoadingProductsState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetProductsSuccessState) {
            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .6,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3),
              itemCount: BlocProvider.of<ProductCubit>(context).prodcuts.length,
              itemBuilder: (context, index) {
                final model = BlocProvider.of<ProductCubit>(context).prodcuts[index];
                return _products(model);
              },
            );
          }else if (state is GetProductsFailureState){
            return Text('${state.errmessage}');

          }
          else {
            return Center(
              child: Text("Something Is Wrong"),
            );
          }
        },
      );
  Widget _products(ProductsModel model) => InkWell(
        borderRadius: BorderRadius.circular(19),
        highlightColor: Colors.orange,
        splashColor: Colors.orange,
        onTap: () {
          BlocProvider.of<SingleProCubit>(context).getSingleProduct(model.id!);


          Navigator.push(context, MaterialPageRoute(
              builder: (context) => Product()
          ));


          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => ));
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
                  Image.network(
                    '${model.image}',
                    height: 120,
                  ),
                  Container(
                    height: 150,
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
                          '${model.name}',
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '${model.price}\$',
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
      items: images,
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ));
}
