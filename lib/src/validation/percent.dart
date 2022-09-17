import '../enum/percent_failure_enum.dart';
import '../utils/either.dart';
import '../utils/value_object.dart';

class Percent extends ValueObject<PercentFailureEnum, double> {
  factory Percent(String value) {
    final double? percentValue = double.tryParse(value);

    if (value.trim().isEmpty) {
      return Percent.create(left(PercentFailureEnum.Empty));
    }

    if (percentValue == null || percentValue.isNaN) {
      return Percent.create(left(PercentFailureEnum.Invalid));
    }

    if (percentValue < 0 || percentValue > 100) {
      return Percent.create(left(PercentFailureEnum.OutOfRange));
    }

    return Percent.create(right(percentValue));
  }

  factory Percent.empty() {
    return Percent.create(left(PercentFailureEnum.Empty));
  }

  Percent.create(super.value);
}
