const String input = 'on 18 0 set inc set inc set inc inc set';
void main(List<String> args) {
  var splitedInput = input.split(' ');
  var onIndex;
  for (var i = 0; i < splitedInput.length; i++) {
    if (splitedInput[i] == 'on') {
      var hr = int.parse(splitedInput[i + 1]);
      var min = int.parse(splitedInput[i + 2]);
      if (hr >= 0 && hr <= 24 && min >= 0 && min <= 60) {
        onIndex = i + 3;
      } else {
        print('invalid datetime');
      }
      var clock = Clock(hr, min, ClockState(IdleState()));
      for (var i = onIndex; i < splitedInput.length; i++) {
        if (splitedInput[i] == 'set') {
          clock.clockState.currentState.nextState(clock.clockState);
          print('change state');
        } else if (splitedInput[i] == 'inc') {
          clock.clockState.currentState.increase(clock.clockState);
          print('inc');
        }
      }
      print(clock.toString());
    }
  }
}

class Clock {
  final ClockState clockState;
  int hr;
  int min;

  Clock(this.hr, this.min, this.clockState) {
    clockState.clock = this;
  }

  void set() {
    clockState.nextState();
  }

  void inc() {
    clockState.currentState.increase(clockState);
  }

  @override
  String toString() {
    return 'hour : $hr min : $min';
  }
}

class ClockState {
  State currentState;
  Clock? clock;

  ClockState(this.currentState);

  void nextState() {
    currentState.nextState(this);
  }

  void setState(State nextState) {
    currentState = nextState;
  }
}

abstract class State {
  void nextState(ClockState clockState) {}
  void increase(ClockState clockState) {}
}

class IdleState extends State {
  @override
  void nextState(ClockState clockState) {
    clockState.setState(HrState());
  }

  @override
  void increase(ClockState clockState) {}
}

class HrState extends State {
  @override
  void nextState(ClockState clockState) {
    clockState.setState(MinState());
  }

  @override
  void increase(ClockState clockState) {
    clockState.clock!.hr = (clockState.clock!.hr + 1) % 24;
  }
}

class MinState extends State {
  @override
  void nextState(ClockState clockState) {
    clockState.setState(IdleState());
  }

  @override
  void increase(ClockState clockState) {
    clockState.clock!.min = (clockState.clock!.min + 1) % 60;
  }
}
