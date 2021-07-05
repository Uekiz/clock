class ClockState {
  static final ClockState _singleton = ClockState._internal();

  factory ClockState() {
    return _singleton;
  }

  ClockState._internal();

  var current = 'on';

  void goNext() {
    if(current == 'on'){
      
    }

    if(current ==  'idle'){
      current = 'setHr';
    }else if(current == 'setHr'){
      current =  'setMin';
    }else if(current == 'setMin'){
      current = 'idle';
    }
  }
}