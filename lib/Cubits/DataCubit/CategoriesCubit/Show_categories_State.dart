import 'package:allyyuegbk/models/products_model.dart';

abstract class specificCategoryState{}
class IntialCategoryState extends specificCategoryState{}


class LoadingCategoryState extends specificCategoryState{}
class GetCategorySuccessState extends specificCategoryState{
  List<ProductsModel> categore ;
  GetCategorySuccessState(this.categore);
}
class GetCategoryFailureState extends specificCategoryState{
  String errmessage;
  GetCategoryFailureState(this.errmessage);

}