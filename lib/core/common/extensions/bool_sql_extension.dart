/// Extending the bool class with a new method called `toNumber()`
extension ToSql on bool {
  int toNumber() => this ? 1 : 0;
}

/// Extending the int class with a new method called `toBool()`
extension FromSql on int? {
  bool toBool() => this == null ? false : this == 1;
}
