class MyDuration {
  final int _milliseconds;
  MyDuration(this._milliseconds)
    : assert(_milliseconds >= 0, "Input duration must be positive ");
  MyDuration.fromMilliSeconds(this._milliseconds)
    : assert(_milliseconds >= 0, "Input duration must be positive ");
  MyDuration.fromHours(int hours)
    : assert(hours >= 0, "Input duration must be positive "),
      _milliseconds = hours * 3600000;
  MyDuration.fromMinutes(int minutes)
    : assert(minutes >= 0, "Input duration must be positive "),
      _milliseconds = minutes * 60000;
  MyDuration.fromSeconds(int seconds)
    : assert(seconds >= 0, "Input duration must be positive "),
      _milliseconds = seconds * 1000;

  MyDuration operator +(MyDuration other) => MyDuration(_milliseconds + other._milliseconds);
  bool operator >(MyDuration other) => _milliseconds > other._milliseconds;
  bool operator <(MyDuration other) => _milliseconds < other._milliseconds;
  MyDuration operator -(MyDuration other) {
    int afterMinus = _milliseconds - other._milliseconds;
    if (afterMinus < 0) {
      throw Exception("Duration can not be negative");
    }
    return MyDuration(afterMinus);
  }

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1 > duration2); //true
  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e);
  }
}
