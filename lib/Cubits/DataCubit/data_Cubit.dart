import 'package:allyyuegbk/Cubits/DataCubit/data_State.dart';
import 'package:allyyuegbk/Services/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<DataState>{
  DataCubit(this.networkServes) : super(IntialState());
  Network networkServes;
   List<dynamic> prodcuts =[];
  List<dynamic> categories=[];

  getData() async
  {
    emit(LodingDataState());
    try{
      prodcuts=await networkServes.getProducts();
      categories= await networkServes.getAllCategories();
      emit(GetDataSuccessState());
    }on Exception catch (e){
      emit(GetDataFailureState(e.toString()));
      print(e);

    }

  }


}