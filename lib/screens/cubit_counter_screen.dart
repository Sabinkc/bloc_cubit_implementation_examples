import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            return Text(
              state.toString(),
              style: TextStyle(
                fontSize: 30,
              ),
            );
          },
        )),
        floatingActionButton: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().increment();
              },
              child: const Icon(Icons.add),
            ),
            SizedBox(
              height: 50,
            ),
            FloatingActionButton(
              onPressed: () {
                context.read<CounterCubit>().decrement();
              },
              child: const Icon(Icons.delete),
            ),
          ],
        ));
  }
}

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
