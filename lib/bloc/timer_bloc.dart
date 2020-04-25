import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_timer/bloc/timer_event.dart';
import 'package:flutter_timer/bloc/timer_state.dart';

import '../ticker.dart';
//import 'package:flutter_timer/bloc/bloc.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final Ticker _ticker;
  final int _duration = 60;

  StreamSubscription<int> _tickerSubscription;

  TimerBloc({@required Ticker ticker})
      : assert(ticker != null),
        _ticker = ticker;

  @override
  TimerState get initialState => Ready(_duration);

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    // try to understand this yield star. might be cause it is yielding a fn?
    if (event is Start)
      yield* _mapStartToState(event);
    else if (event is Tick)
      yield* _mapTickToState(event);
    else if (event is Paused)
      yield* _mapPauseToState(event);
    else if (event is Resume)
      yield* _mapResumeToState(event);
    else if (event is Reset) yield* _mapResetToState(event);
  }

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  Stream<TimerState> _mapStartToState(Start start) async* {
    yield Running(start.duration);
    _tickerSubscription?.cancel();
    _tickerSubscription = _ticker
        .tick(ticks: start.duration)
        .listen((duration) => add(Tick(duration: duration)));
  }

  Stream<TimerState> _mapTickToState(Tick tick) async* {
    yield tick.duration > 0 ? Running(tick.duration) : Finished();
  }

  Stream<TimerState> _mapPauseToState(Pause pause) async* {
    if (state is Running) {
      _tickerSubscription?.pause();
      yield Paused(state.duration);
    }
  }

  Stream<TimerState> _mapResumeToState(Resume event) async* {
    if (state is Paused) {
      _tickerSubscription?.resume();
      yield Running(state.duration);
    }
  }

  _mapResetToState(Reset event) async* {
    _tickerSubscription?.cancel();
    yield Ready(_duration);
  }
}
