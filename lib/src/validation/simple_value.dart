import '../enum/simple_value_failure_enum.dart';
import '../utils/either.dart';
import '../utils/value_object.dart';

class SimpleValue extends ValueObject<SimpleValueFailureEnum, String> {
  factory SimpleValue(String value) {
    if (value.trim().isEmpty) {
      return SimpleValue.create(left(SimpleValueFailureEnum.Empty));
    }

    return SimpleValue.create(right(value));
  }

  factory SimpleValue.empty() {
    return SimpleValue.create(left(SimpleValueFailureEnum.Empty));
  }

  SimpleValue.create(Either<SimpleValueFailureEnum, String> value) : super(value);
}
