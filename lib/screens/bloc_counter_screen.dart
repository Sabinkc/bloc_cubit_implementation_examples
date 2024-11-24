import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCounterScreen extends StatelessWidget {
  const BlocCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CounterBloc>().add(IncrementCounterEvent());
        },
        child: Icon(Icons.add),
      ),
      body: Center(child: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Text(
            state.toString(),
            style: TextStyle(fontSize: 30),
          );
        },
      )),
    );
  }
}

//bloc events
class CounterEvent {}

class IncrementCounterEvent extends CounterEvent {}

class DecrementCounterEvent extends CounterEvent {}

//bloc
class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementCounterEvent>((event, emit) {
      emit(state + 1);
    });
    on<DecrementCounterEvent>((event, emit) {
      emit(state - 1);
    });
  }
}
