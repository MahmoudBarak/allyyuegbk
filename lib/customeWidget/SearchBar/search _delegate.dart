import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/products_Cubit.dart';
import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/single_product_cubit.dart';
import 'package:allyyuegbk/Screens/Products%20Screens/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Search extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filter =BlocProvider.of<ProductCubit>(context).listofProducts.where((element) {
      return element.name!.contains(query);
    } ).toList() ;

    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            query = (query == "" ? BlocProvider.of<ProductCubit>(context).listofProducts[index].name : filter[index].name)!;
            BlocProvider.of<SingleProCubit>(context).getSingleProduct(filter[index].id!);
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) =>  OneProduct()));
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            child:  query == "" ? const Center(child: Text("Search to get your product ")) :Text('${filter[index].name}'),
          ),
        );
      },
      itemCount: query == "" ? 1 : filter.length,
    );
  }
}