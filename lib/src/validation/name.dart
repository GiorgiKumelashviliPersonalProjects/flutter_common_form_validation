import '../config/vvo_config.dart';
import '../enum/name_failure_enum.dart';
import '../utils/either.dart';
import '../utils/value_object.dart';

class Name extends ValueObject<NameFailureEnum, String> {
  factory Name(String name) {
    if (name.trim().isEmpty) {
      return Name.create(left(NameFailureEnum.Empty));
    }

    if (name.length < VVOConfig.name.minLength) {
      return Name.create(left(NameFailureEnum.TooShort));
    }

    return Name.create(right(name));
  }

  factory Name.empty() {
    return Name.create(left(NameFailureEnum.Empty));
  }

  const Name.create(super.value);
}
