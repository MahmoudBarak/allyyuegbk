
 import 'package:allyyuegbk/models/products_model.dart';
import 'package:dio/dio.dart';
//
class Network{
 Future<List<dynamic>> getProducts()async{
   final responsep = await Dio().get('https://fakestoreapi.com/products');

     return responsep.data;
 }
 Future<List<dynamic>> getAllCategories()async{
final response= await Dio().get('https://fakestoreapi.com/products/categories')   ;

return response.data;
 }




}