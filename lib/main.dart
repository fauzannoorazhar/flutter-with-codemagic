import 'package:bloc_testing/bloc/counter/counter_cubit.dart';
import 'package:bloc_testing/bloc/testing/testing_bloc.dart';
import 'package:bloc_testing/screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => TestingBloc()),
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final CounterState counterState = BlocProvider.of<CounterCubit>(context, listen: true).state;
    final TestingState testingState = BlocProvider.of<TestingBloc>(context, listen: true).state;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen2()));
              },
              child: const Text('Go to Screen 2')
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<CounterCubit>(context).increment();
          BlocProvider.of<TestingBloc>(context).add(IncrementEvent());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
