import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_final_exam/Bloc/product_bloc.dart';
import 'package:flutter_final_exam/Bloc/product_events.dart';
import 'package:flutter_final_exam/Bloc/product_states.dart';
import 'package:flutter_final_exam/Core/Repository/product_repository.dart';
import 'package:intl/intl.dart';


class Question1 extends StatefulWidget 
{
  final DataRepository dataRepository;
  const Question1({super.key, required this.dataRepository});

  @override
  State<Question1> createState() => _Question1State();
}

class _Question1State extends State<Question1> 
{
  late DataBloc _dataBloc;
  int totalAmount = 0;

  @override
  void initState() 
  {
    super.initState();
    _dataBloc = DataBloc(dataRepository: widget.dataRepository);
    _dataBloc.add(const fecthDataEvent_DataEventsFile());
  }
  
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      backgroundColor: const Color.fromARGB(255, 224, 224, 224),
      appBar: AppBar
      (
        backgroundColor: const Color.fromARGB(255, 224, 224, 224),
        leading: Icon(Icons.arrow_back_rounded),
        actions: [Padding(padding: EdgeInsets.all(20.0), child: Icon(Icons.more_horiz_rounded))],
      ),
      body: Column
      (
        mainAxisAlignment: MainAxisAlignment.start,
        children: 
        [
          Padding
          (
            padding: EdgeInsets.all(30.0),
            child: Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: 
              [
            
                Column
                (
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: 
                  [
                    Text(DateFormat('EEEE').format(DateTime.now()).toUpperCase(), style: TextStyle(color: Colors.grey),),
                    Text(DateTime.now().day.toString() + ' ' + DateFormat('MMM').format(DateTime.now()), style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
                    
                  ],
                ),
                Text(
                  // ---- Funcion jo value return karay
                  '\$' + totalAmount.toString(),
                  style: TextStyle
                  (
                    color: Colors.blue,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
          Container
          (
            width: double.infinity,
            
            decoration: BoxDecoration
            (
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            // child: 
            // ListTile
            // (
            //   leading: NetworkImage
            //   (
            //     url
            //   ),
            //   title: ,
            //   subtitle: ,
            // )
            child: Center
            (
              child: _BlocBuilderBananayWalaFunction()
              // child: Text('Haha')
            )





            // child: Text(DateFormat('yMd').format(DateTime.now())),

          )
        ],
      ),
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
          // child: ListTile
          // (
          //   leading: const Icon(Icons.person),
          //   title: Text(obj.title ?? '--'),
          //   subtitle: Text(obj.id.toString()),
          //   trailing: CircleAvatar(backgroundColor: Colors.black, foregroundColor: Colors.red,),
          // ),
          child: ListTile
          (
            leading: ClipRRect
            (
              borderRadius: BorderRadius.circular(20.0),//or 15.0
              child: Container
              (
                height: 20.0,
                width: 20.0,
                child: Expanded(child: Image.network(obj.images.toString())),
              ),
            ),
            title: Text(obj.title, style: TextStyle(color: Colors.black, fontSize: 15.0),),
            subtitle: (obj.day == DateTime.now().day && obj.month == DateFormat('MMM').format(DateTime.now()) && obj.year == DataTime.now().year) ? "Today" :(Text(obj.day.toString() + " " + obj.month.toString() + " " + obj.year.toString(), style: TextStyle(color: Colors.grey, fontSize: 10.0),),
            trailing: (obj.amount < 0) ? Text("\$-" + obj.amount.toString(), style: TextStyle(color: (obj.amount < 0) ? Colors.red : Colors.blue, fontSize: 15.0),) : Text("\$+" + obj.amount.toString(), style: TextStyle(color: (obj.amount < 0) ? Colors.red : Colors.blue, fontSize: 15.0),),
          )
        );
      }
    );
  }
}