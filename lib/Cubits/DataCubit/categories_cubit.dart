import 'package:allyyuegbk/Cubits/DataCubit/categories_State.dart';
import 'package:allyyuegbk/Cubits/DataCubit/product_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Services/dio_helper.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.networkServes) : super(IntialCategoriesState());

  Network networkServes;
  List<dynamic> categories = [];

  getCategories() async
  {
    emit(LoadingCategoriesState());
    try {
      categories = await networkServes.getAllCategories();
      emit(GetCategoriesSuccessState());
    } on Exception catch (e) {
      emit(GetCategoriesFailureState(e.toString()));
      print(e);
    }
  }
}