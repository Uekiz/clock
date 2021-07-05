import 'clockState.dart';

const String input = 'on 18 0 set inc set inc set inc inc set';
void main(List<String> arguments) {
  var onIndex;
  var state;
  var splitedInput = input.split(' ');
  print(splitedInput.length);
  print(state);
  print(onIndex);
  for (var i = 0; i < splitedInput.length; i++) {
    if (splitedInput[i] == 'on' && state == null) {
      var hr = int.parse(splitedInput[i + 1]);
      var min = int.parse(splitedInput[i + 2]);
      if (hr >= 0 && hr <= 24 && min >= 0 && min <= 60) {
        state = ClockState(hr, min);
        onIndex = i + 3;
      } else {
        print('invalid datetime');
      }
    }
    if (state != null) {
      for (var i = onIndex; i < splitedInput.length; i++) {
        if (splitedInput[i] == 'set') {
          state.goNext();
          print('change state');
        } else if (splitedInput[i] == 'inc' && state.current == 'setHr') {
          state.incHr();
          print('inc hr');
        } else if (splitedInput[i] == 'inc' && state.current == 'setMin') {
          state.incMin();
          print('inc min');
        }
      }
    }
  }
  print('time = ${state.hr} : ${state.min}');
}
