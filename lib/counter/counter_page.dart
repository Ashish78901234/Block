import 'package:blockproject/counter/counter_page/counter_bloc.dart';
import 'package:blockproject/counter/counter_page/counter_event.dart';
import 'package:blockproject/counter/counter_page/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget{

 int counter;

  CounterPage({super.key, this.counter = 0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Page',style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                if (state is CounterInitialState) {
                  return Text('Count: ${state.count}', style: TextStyle(fontSize: 24));
                } else if (state is CounterIncrementState) {
                  return Text('Incremented Count: ${state.incCount}', style: TextStyle(fontSize: 24));
                } else if (state is CounterDecrementState) {
                  return Text('Decremented Count: ${state.decCount}', style: TextStyle(fontSize: 24));
                }
                return Text('Unknown State', style: TextStyle(fontSize: 24));
              },
            ),

            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>()
                        .add(CounterIncrementEvent(incCount: counter++),
                        );},
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<CounterBloc>()
                        .add(CounterDecrementEvent(decCount: counter--),
                    );
                        
                  },  child: Text('-'),
                    
            )]
        )
    ]  )
      )
    );
  }
}