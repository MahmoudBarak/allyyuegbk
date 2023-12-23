import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/product_State.dart';
import 'package:allyyuegbk/Services/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductCubit extends Cubit<DataState>{
  ProductCubit(this.networkServes) : super(IntialState());
  Network networkServes;



  getProducts() async
  {
    emit(LoadingProductsState());

     var data=await networkServes.getProducts();
     data.fold((Failure) {
       emit(GetProductsFailureState(Failure.errMassage));

     }, (product) {
       emit(GetProductsSuccessState(product));

     } );




  }







}