

class Chart {
  int _id;
  String _chartCode;
  String _description;
  String _date;
  String _coordinates;
  String _maxRunwayLength;

  Chart(this._id, this._chartCode, this._description, this._date, this._coordinates, this._maxRunwayLength);

  int get id => _id;

  String get description => _description;

  String get chartCode => _chartCode;

  String get date => _date;

  String get coordinates => _coordinates;

  String get maxRunwayLength => _maxRunwayLength;
}