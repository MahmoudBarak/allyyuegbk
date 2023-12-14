abstract class DataState{}
class IntialState extends DataState{}
class LoadingProductsState extends DataState{}
class GetProductsSuccessState extends DataState{}
class GetProductsFailureState extends DataState{
  String errmessage;
  GetProductsFailureState(this.errmessage);

}



