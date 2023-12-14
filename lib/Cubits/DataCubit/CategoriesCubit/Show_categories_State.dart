abstract class ShowCategoryState{}
class IntialCategoryState extends ShowCategoryState{}


class LoadingCategoryState extends ShowCategoryState{}
class GetCategorySuccessState extends ShowCategoryState{}
class GetCategoryFailureState extends ShowCategoryState{
  String errmessage;
  GetCategoryFailureState(this.errmessage);

}