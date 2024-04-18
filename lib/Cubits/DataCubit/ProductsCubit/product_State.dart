import 'package:allyyuegbk/models/products_model.dart';


abstract class DataState{}
class IntialState extends DataState{}
class LoadingProductsState extends DataState{}
class GetProductsSuccessState extends DataState{
 List<ProductsModel> prodcuts ;
 GetProductsSuccessState(this.prodcuts);
}
class GetProductsFailureState extends DataState{
 final String errmessage;
  GetProductsFailureState( this.errmessage);


}



