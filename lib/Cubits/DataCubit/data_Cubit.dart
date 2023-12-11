import 'package:allyyuegbk/Cubits/DataCubit/data_State.dart';
import 'package:allyyuegbk/Services/dio_helper.dart';
import 'package:allyyuegbk/models/cartModel.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<DataState>{
  DataCubit(this.networkServes) : super(IntialState());
  Network networkServes;
   List<ProductsModel> prodcuts =[];
  List<dynamic> categories=[];
  List<CartModel> carts=[];

  getData() async
  {
    emit(LodingDataState());
    try{
      prodcuts=await networkServes.getProducts();
      categories= await networkServes.getAllCategories();
      emit(GetDataSuccessState());
    }on Exception catch (e){
      emit(GetDataFailureState(e.toString()));
      print(e);

    }

  }
  getCarts() async
  {
    emit(LodingCartsState());
  try{
  carts=await networkServes.getAllCarts();
  emit(GetCartsSuccessState());
  }on Exception catch (e)
  {
  emit(GetCartsFailureState(e.toString()));
  print(e);

  }



}

}