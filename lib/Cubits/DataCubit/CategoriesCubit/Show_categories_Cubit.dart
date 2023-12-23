import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/Show_categories_State.dart';
import 'package:allyyuegbk/Services/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecificCategoryCubit extends Cubit<specificCategoryState> {
  SpecificCategoryCubit(this.networkServes) : super(IntialCategoryState());

  Network networkServes;

  getCategory(String cat) async {
    emit(LoadingCategoryState());

    var categore = await networkServes.getspecificCategory(cat);
    categore.fold(
        (failure) => emit(GetCategoryFailureState(failure.errMassage)),
        (category) => emit(GetCategorySuccessState(category)));
  }
}
