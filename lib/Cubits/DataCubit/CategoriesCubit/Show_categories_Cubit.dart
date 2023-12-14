import 'package:allyyuegbk/Cubits/DataCubit/CategoriesCubit/Show_categories_State.dart';
import 'package:allyyuegbk/Services/dio_helper.dart';
import 'package:allyyuegbk/models/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowCategory extends Cubit<ShowCategoryState>
{
  ShowCategory(this.networkServes) : super(IntialCategoryState());

  Network networkServes;
  List<ProductsModel> Categore =[];


  getCategory(String cat) async
  {
    emit(LoadingCategoryState());
    try
    {
      Categore= await networkServes.getCategory(cat);
      emit(GetCategorySuccessState());

    } on Exception catch(e){
      emit(GetCategoryFailureState(e.toString()));
    }
  }

}