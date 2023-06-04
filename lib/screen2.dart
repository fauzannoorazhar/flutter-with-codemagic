// Created by Muhammad Fauzan Noor (muhammadfauzan.noorazhar@chromeasia.co) on 13/05/23.
// Copyright (c) 2023 PT. Little Wallet. All rights reserved

import 'package:bloc_testing/bloc/counter/counter_cubit.dart';
import 'package:bloc_testing/bloc/testing/testing_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {


  @override
  Widget build(BuildContext context) {
    final CounterState counterState = BlocProvider.of<CounterCubit>(context, listen: true).state;
    final TestingState testingState = BlocProvider.of<TestingBloc>(context, listen: true).state;

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "Counter Cubit ${counterState.countData.toString()}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              "Testing Bloc ${testingState.countData.toString()}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).decrement();
          BlocProvider.of<TestingBloc>(context).add(DecrementEvent());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.exposure_minus_1),
      ),
    );
  }


}
