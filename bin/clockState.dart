class ClockState {
  int hr;
  int min;

  ClockState(int startHr, int startMin)
      : hr = startHr,
        min = startMin;


  var current = 'on';



  void goNext() {
    if (current == 'on') {
      current = 'idle';
    } else if (current == 'idle') {
      current = 'setHr';
    } else if (current == 'setHr') {
      current = 'setMin';
    } else if (current == 'setMin') {
      current = 'idle';
    }
  }

  void incHr(){
    hr = hr+1;
  }

  void incMin(){
    min = min+1;
  }

}
