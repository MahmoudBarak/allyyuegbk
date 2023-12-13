abstract class SingleState{}
class IntialSingleState extends SingleState{}


class LoadingSingleProductState extends SingleState{}
class GetSingleProductSuccessState extends SingleState{}
class GetSingleProductFailureState extends SingleState{
  String erorr;
  GetSingleProductFailureState(this.erorr);
}