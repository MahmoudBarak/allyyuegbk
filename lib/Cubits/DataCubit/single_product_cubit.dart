import 'package:allyyuegbk/Cubits/DataCubit/single_product_state.dart';
import 'package:allyyuegbk/Services/dio_helper.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProCubit extends Cubit<SingleState>{
  SingleProCubit(this.networkServes,this.oneProduct) : super(IntialSingleState());
  Network networkServes;
  ProductsModel oneProduct;
  getSingleProduct(int productId)async{
    emit(LoadingSingleProductState());
    try{
      oneProduct=await networkServes.getSingleProduct(productId);
      emit(GetSingleProductSuccessState());
    } on Exception catch(e){
      emit(GetSingleProductFailureState(e.toString()));

    }
  }


}