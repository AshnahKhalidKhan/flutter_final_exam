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

  //////////////////////////////////////////////////////////
  @override
  Stream<DataState> mapEventToState(DataEvent event) async* 
  {
    if (event is fetchDataEvent_DataEventsFile) 
    {
      yield LoadingState();
      try 
      {
        final data = await dataRepository.getDataFutureFunctionRepositoryFile();
        yield SuccessOrLoadedState(data: data);
      } 
      catch (e) 
      {
        yield ErrorState(error: 'Error fetching data: $e');
      }
    } 
    else if (event is createDataEvent_DataEventsFile) 
    {
      try 
      {
        await dataRepository.createDataFutureFunctionRepositoryFile(event.product);
        yield* mapEventToState(fetchDataEvent_DataEventsFile()); // Refresh data after creation
      } 
      catch (e) 
      {
        yield ErrorState(error: 'Error creating product: $e');
      }
    } 
    else if (event is readDataEvent_DataEventsFile) 
    {
      yield LoadingState();
      try 
      {
        final data = await dataRepository.readDataFutureFunctionRepositoryFile();
        yield SuccessOrLoadedState(data: data);
      } 
      catch (e) 
      {
        yield ErrorState(error: 'Error reading data: $e');
      }
    } 
    else if (event is updateDataEvent_DataEventsFile) 
    {
      try 
      {
        await dataRepository.updateDataFutureFunctionRepositoryFile(event.productId, event.product);
        yield* mapEventToState(fetchDataEvent_DataEventsFile()); // Refresh data after update
      } 
      catch (e) 
      {
        yield ErrorState(error: 'Error updating product: $e');
      }
    } 
    else if (event is deleteDataEvent_DataEventsFile) 
    {
      try 
      {
        await dataRepository.deleteDataFutureFunctionRepositoryFile(event.productId);
        yield* mapEventToState(fetchDataEvent_DataEventsFile()); // Refresh data after deletion
      } 
      catch (e) 
      {
        yield ErrorState(error: 'Error deleting product: $e');
      }
    }
  }
}