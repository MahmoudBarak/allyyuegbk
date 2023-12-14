import 'package:allyyuegbk/models/cartModel.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:dio/dio.dart';

//
class Network {
  Future<List<ProductsModel>> getProducts() async {
    final responsep = await Dio().get('https://fakestoreapi.com/products');
    final listOfProducts = List.from(responsep.data)
        .map((e) => ProductsModel.fromjson(e))
        .toList();

    return listOfProducts;
  }

  Future<List<dynamic>> getAllCategories() async {
    final response =
        await Dio().get('https://fakestoreapi.com/products/categories');

    return response.data;
  }

  Future<List<CartModel>> getAllCarts() async {
    final responsep = await Dio().get('https://fakestoreapi.com/carts');
    final listOfCarts =
        List.from(responsep.data).map((e) => CartModel.fromJson(e)).toList();
    return listOfCarts;

  }
  Future<ProductsModel> getSingleProduct(int productId) async{

    final response=await Dio().get('https://fakestoreapi.com/products/$productId');
    final product=ProductsModel.fromjson(response.data);
    return product;

  }
  Future<List<ProductsModel>> getCategory(String cat) async {
    final responsep = await Dio().get('https://fakestoreapi.com/products/category/${cat}');
    final category = List.from(responsep.data)
        .map((e) => ProductsModel.fromjson(e))
        .toList();

    return category;
  }



}
