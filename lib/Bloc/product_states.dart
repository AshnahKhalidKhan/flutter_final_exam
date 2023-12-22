import 'package:equatable/equatable.dart';
import 'package:flutter_final_exam/Models/product_model.dart';

abstract class DataState extends Equatable
{
  const DataState([List props = const[]]) : super();

  @override
  List<Object> get props => [];
}

class EmptyState extends DataState
{
  //Ye empty rahay ga
}

class LoadingState extends DataState
{
  //Ye bhi empty rahay ga
}

class SuccessOrLoadedState extends DataState
{
  final List<Products> data;
  SuccessOrLoadedState({required this.data}) : super([data]);
}

class ErrorState extends DataState
{
  final String? error;
  ErrorState({this.error});
}