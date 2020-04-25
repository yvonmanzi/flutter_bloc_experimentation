class Ticker {
  Stream<int> tick({int ticks}) {
    //x starts from 0 and is incremented each second. x is the argument in the callback
    return Stream.periodic(Duration(seconds: 1), (x) => ticks - x - 1)
        .take(ticks);
  }
}
