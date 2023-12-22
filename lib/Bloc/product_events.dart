import 'package:equatable/equatable.dart';
import 'package:flutter_final_exam/Models/product_model.dart';

abstract class DataEvent extends Equatable
{
  const DataEvent([List props = const[]]) : super();
}

class fecthDataEvent_DataEventsFile extends DataEvent
{
  const fecthDataEvent_DataEventsFile() : super();
  
  @override
  List<Object?> get props => throw UnimplementedError();
}

////////////////////////////////////////////////////////////
class fetchDataEvent_DataEventsFile extends DataEvent 
{
  const fetchDataEvent_DataEventsFile() : super();
  
  @override
  List<Object?> get props => throw UnimplementedError();
}

class readDataEvent_DataEventsFile extends DataEvent 
{
  const readDataEvent_DataEventsFile() : super();
  
  @override
  List<Object?> get props => throw UnimplementedError();
}

/////////////////////////////////////////////////////////////////
class createDataEvent_DataEventsFile extends DataEvent 
{
  final Products product;
  createDataEvent_DataEventsFile({required this.product});

  @override
  List<Object?> get props => [product];
}

class updateDataEvent_DataEventsFile extends DataEvent 
{
  final String productId;
  final Products product;
  updateDataEvent_DataEventsFile({required this.productId, required this.product});

  @override
  List<Object?> get props => [productId, product];
}

class deleteDataEvent_DataEventsFile extends DataEvent 
{
  final String productId;
  deleteDataEvent_DataEventsFile({required this.productId});

  @override
  List<Object?> get props => [productId];
}