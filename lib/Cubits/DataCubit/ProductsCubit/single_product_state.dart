import 'package:allyyuegbk/models/products_model.dart';

abstract class SingleState{}
class IntialSingleState extends SingleState{}


class LoadingSingleProductState extends SingleState{}
class GetSingleProductSuccessState extends SingleState{
  ProductsModel oneProduct;
  GetSingleProductSuccessState(this.oneProduct);

}
class GetSingleProductFailureState extends SingleState{
  String erorr;
  GetSingleProductFailureState(this.erorr);

}