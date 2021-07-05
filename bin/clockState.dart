class ClockState {
  int hr;
  int min;

  ClockState(int startHr, int startMin)
      : hr = startHr,
        min = startMin;

  var current = 'idle';

  void goNext() {
    if (current == 'idle') {
      current = 'setHr';
    } else if (current == 'setHr') {
      current = 'setMin';
    } else if (current == 'setMin') {
      current = 'idle';
    }
  }

  void incHr() {
    if (hr == 24) {
      hr = 0;
    } else {
      hr = hr + 1;
    }
  }

  void incMin() {
    if (min == 60) {
      min = 0;
    } else {
      min = min + 1;
    }
  }
}
