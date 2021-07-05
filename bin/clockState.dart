class ClockState {
  static final ClockState _singleton = ClockState._internal();

  factory ClockState() {
    return _singleton;
  }

  ClockState._internal();

  
}