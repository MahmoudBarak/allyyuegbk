

import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/product_State.dart';
import 'package:allyyuegbk/Services/dio_helper.dart';
import 'package:allyyuegbk/models/cartModel.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<DataState>{
  static ProductCubit bp(context)=>BlocProvider.of(context);
  ProductCubit(this.networkServes) : super(IntialState());
  Network networkServes;
   List<ProductsModel> prodcuts =[];


  getProducts() async
  {
    emit(LoadingProductsState());
    try{
      prodcuts=await networkServes.getProducts();
      emit(GetProductsSuccessState());
    }on Exception catch (e){
      emit(GetProductsFailureState(e.toString()));
      print(e);

    }

  }







}