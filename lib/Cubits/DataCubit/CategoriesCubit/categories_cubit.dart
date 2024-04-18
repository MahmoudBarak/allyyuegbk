import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/categories_State.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Services/dio_helper.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this.networkServes) : super(IntialCategoriesState());

  Network networkServes;

  getCategories() async {
    emit(LoadingCategoriesState());

    var category = await networkServes.getAllCategories();
    category.fold(
        (failure) => emit(GetCategoriesFailureState(failure.errMassage)),
        (category) => emit(GetCategoriesSuccessState(category)));
  }
}
