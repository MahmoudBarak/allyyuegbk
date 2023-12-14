import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/Show_categories_Cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/Show_categories_State.dart';
import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/single_product_cubit.dart';
import 'package:allyyuegbk/Screens/Cart.dart';
import 'package:allyyuegbk/Screens/Product.dart';
import 'package:allyyuegbk/models/cartModel.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              _searchAndCart(),
              Column(children: [_items(),],),
          
              
          
          
            ],
          ),
        ),
      ) ,

    );
  }
  Widget _searchAndCart() => Container(
    padding: EdgeInsets.all(20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {

            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_outlined,
          ),
        ),

        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          width: 260,
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
                      .push(MaterialPageRoute(builder: (context) =>Cart() ));

                },
                icon: Icon(
                  Icons.shopping_cart,
                )))
      ],
    ),
  );

  Widget _items() => BlocBuilder<ShowCategory, ShowCategoryState>(
    builder: (context, state) {
      if (state is LoadingCategoryState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is GetCategorySuccessState) {
        return GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .6,
              mainAxisSpacing: 3,
              crossAxisSpacing: 3),
          itemCount: BlocProvider.of<ShowCategory>(context).Categore.length,
          itemBuilder: (context, index) {
            final model = BlocProvider.of<ShowCategory>(context).Categore[index];
            return _products(model);
          },
        );
      }else if (state is GetCategoryFailureState){
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
          builder: (context) => OneProduct()));


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
}





