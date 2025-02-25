import 'package:dart_frog/dart_frog.dart';
import 'package:websocket/counter/cubit/counter_cubit.dart';

final _counter = CounterCubit();

/// Provide the counter instance via `RequestContext`.
final counterProvider = provider<CounterCubit>(
  (_) => _counter,
);
