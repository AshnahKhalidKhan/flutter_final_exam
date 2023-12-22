import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_exam/Bloc/product_events.dart';
import 'package:flutter_final_exam/Bloc/product_states.dart';
import 'package:flutter_final_exam/Core/Repository/product_repository.dart';
import 'package:flutter_final_exam/Models/product_model.dart';

class DataBloc extends Bloc<DataEvent, DataState>
{
  final DataRepository dataRepository;

  DataBloc({required this.dataRepository})
  :
  super(LoadingState())
  {
    on<fecthDataEvent_DataEventsFile> ((event, emit) async
    {
      await _getDataFutureFunctionBlocFile(emit);
    });
  }

  Future<void> _getDataFutureFunctionBlocFile(Emitter<DataState> emit) async
  {
    emit(LoadingState());
    try
    {
      final List<Products> data = await dataRepository.getDataFutureFunctionRepositoryFile();
      emit(SuccessOrLoadedState(data: data));
    }
    catch (e)
    {
      emit(ErrorState(error: e.toString()));
    }
  }
}