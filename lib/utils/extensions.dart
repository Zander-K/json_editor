extension IntFromString on String {
  int? get asInt {
    final value = this;

    final intValue = int.tryParse(value);

    return intValue;
  }
}

extension BoolFromString on String {
  bool? get asBool {
    final value = this;

    if (value.isNull) {
      return null;
    }

    final boolValue = bool.tryParse(value) ?? false;

    return boolValue;
  }
}

extension NotNullAndNotEmpty on String {
  Null get notNull {
    final value = this;

    if (value == 'null') {
      return null;
    }
  }
}

extension NullAndEmptyExtension<T> on T {
  bool get isNull {
    final value = this;

    return value.toString() == 'null';
  }
}
