import 'package:allyyuegbk/Cubits/DataCubit/ProductsCubit/single_product_state.dart';
import 'package:allyyuegbk/Services/dio_helper.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProCubit extends Cubit<SingleState> {
  SingleProCubit(this.networkServes) : super(IntialSingleState());
  Network networkServes;
  getSingleProduct(int productId) async {
    emit(LoadingSingleProductState());

    var oneProduct = await networkServes.getSingleProduct(productId);
    oneProduct.fold(
        (failure) => GetSingleProductFailureState(failure.errMassage),

        (product) => emit(GetSingleProductSuccessState(product)));
  }
}
