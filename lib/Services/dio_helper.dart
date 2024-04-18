import 'package:allyyuegbk/Services/errors/faliuer.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

//
class Network {
  Future<Either< Failure,List<ProductsModel>>> getProducts() async {
    try{
      final responsep = await Dio().get('https://fakestoreapi.com/products');
      final listOfProducts = List.from(responsep.data)
          .map((e) => ProductsModel.fromjson(e))
          .toList();

      return right(listOfProducts);
    }on Exception catch (e)
    {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));


    }
  }

  Future<Either<Failure,List<dynamic>>> getAllCategories() async {
    try{
      final response =
          await Dio().get('https://fakestoreapi.com/products/categories');

      return right (response.data);
    }on Exception catch (e)
    {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));


    }
  }

  Future<Either<Failure,ProductsModel>> getSingleProduct(int productId) async{
    try{
      final response =
          await Dio().get('https://fakestoreapi.com/products/$productId');
      final product = ProductsModel.fromjson(response.data);
      return right(product);
    }on Exception catch (e)
    {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));


    }
  }
  Future<Either<Failure,List<ProductsModel>>> getspecificCategory(String cat) async {
    try{
      final responsep =
          await Dio().get('https://fakestoreapi.com/products/category/${cat}');
      final category = List.from(responsep.data)
          .map((e) => ProductsModel.fromjson(e))
          .toList();

      return right(category);
    }on Exception catch (e)
    {
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));


    }
  }


}
