import 'package:equatable/equatable.dart';

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