abstract class DataState{}
class IntialState extends DataState{}
class LodingDataState extends DataState{}
class GetDataSuccessState extends DataState{}
class GetDataFailureState extends DataState{
  String errmessage;
  GetDataFailureState(this.errmessage);

}

class LodingCartsState extends DataState{}
class GetCartsSuccessState extends DataState{}
class GetCartsFailureState extends DataState{
  String errmessage;
  GetCartsFailureState(this.errmessage);

}