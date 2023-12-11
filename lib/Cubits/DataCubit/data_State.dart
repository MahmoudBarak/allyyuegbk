abstract class DataState{}
class IntialState extends DataState{}
class LodingDataState extends DataState{}
class GetDataSuccessState extends DataState{}
class GetDataFailureState extends DataState{
  String errmessage;
  GetDataFailureState(this.errmessage);

}