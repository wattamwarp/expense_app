class Category {
  int ? _spend;
  int ? _percentage;
  String ? _name;

  Category(this._spend, this._percentage, this._name);

  String get name => _name!;

  set name(String value) {
    _name = value;
  }

  int get percentage => _percentage!;

  set percentage(int value) {
    _percentage = value;
  }

  int get spend => _spend!;

  set spend(int value) {
    _spend = value;
  }
}
