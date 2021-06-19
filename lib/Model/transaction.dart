
class Transaction{

  int ?_amt;
  String ?_name;
  String ?_day;
  String ?_time;

  Transaction(this._amt, this._name, this._income, this._day, this._time);

  bool? _income;


  String get day => _day!;

  set day(String value) {
    _day = value;
  }

  bool get income => _income!;

  set income(bool value) {
    _income = value;
  }

  String get name => _name!;

  set name(String value) {
    _name = value;
  }

  int get amt => _amt!;

  set amt(int value) {
    _amt = value;
  }

  String get time => _time!;

  set time(String value) {
    _time = value;
  }
}