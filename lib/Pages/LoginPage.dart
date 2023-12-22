import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_exam/Bloc/product_bloc.dart';
import 'package:flutter_final_exam/Bloc/product_events.dart';
import 'package:flutter_final_exam/Bloc/product_states.dart';
import 'package:flutter_final_exam/Core/Repository/product_repository.dart';

class LoginPage extends StatefulWidget 
{
  /*
    Yahaan changes hui hain, dataReporsity import aaur 'required'
  */
  final DataRepository dataRepository;
  const LoginPage({super.key, required this.dataRepository});
  /////////////////////////////////////
  
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> 
{
  /*
    Yahaan changes hui hain, dataReporsity import aaur 'required'
  */
  late DataBloc _dataBloc;

  @override
  void initState() 
  {
    super.initState();
    _dataBloc = DataBloc(dataRepository: widget.dataRepository);
    _dataBloc.add(const fecthDataEvent_DataEventsFile());
  }
  /////////////////////////////////////

  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar
      (
        title: Text('Sub chal raha hai shukar...'),
      ),
      body: Center
      (
        // child: _BlocBuilderBananayWalaFunction(_dataBloc),
        child: _BlocBuilderBananayWalaFunction()
      )
    );
  }

  BlocBuilder<DataBloc, DataState> _BlocBuilderBananayWalaFunction() 
  {
    return BlocBuilder
    (
      bloc: _dataBloc,
      builder: (_, DataState state)
      {
        if (state is EmptyState)
        {
          return const Center(child: Text('EmptyState'));
        }
        if (state is ErrorState)
        {
          return const Text('Error');
        }
        if (state is LoadingState)
        {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is SuccessOrLoadedState)
        {
          return _ListViewBananayWalaFunction(state);
        }
        return const Text('You forgot to cater some state');
      },
    );
  }

  ListView _ListViewBananayWalaFunction(SuccessOrLoadedState state) 
  {
    return ListView.builder
    (
      itemCount: state.data.length,
      itemBuilder: (BuildContext context, int i)
      {
        var obj = state.data[i];
        return Card
        (
          child: ListTile
          (
            leading: const Icon(Icons.person),
            title: Text(obj.title ?? '--'),
            subtitle: Text(obj.id.toString()),
          ),
        );
      }
    );
  }
}