abstract class CategoriesState{}
class IntialCategoriesState extends CategoriesState{}


class LoadingCategoriesState extends CategoriesState{}
class GetCategoriesSuccessState extends CategoriesState{
  List<dynamic> categories ;
  GetCategoriesSuccessState(this.categories);
}
class GetCategoriesFailureState extends CategoriesState{
  String errmessage;
  GetCategoriesFailureState(this.errmessage);

}
