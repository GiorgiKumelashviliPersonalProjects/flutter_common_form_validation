import '../config/vvo_config.dart';
import '../enum/phone_number_failure_enum.dart';
import '../utils/either.dart';
import '../utils/value_object.dart';

class PhoneNumber extends ValueObject<PhoneNumberFailureEnum, String> {
  factory PhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return PhoneNumber.create(left(PhoneNumberFailureEnum.Empty));
    }

    if (!VVOConfig.phoneNuber.patternPhoneNumber.hasMatch(phoneNumber.trim())) {
      return PhoneNumber.create(left(PhoneNumberFailureEnum.Invalid));
    }

    return PhoneNumber.create(right(phoneNumber));
  }

  factory PhoneNumber.empty() {
    return PhoneNumber.create(left(PhoneNumberFailureEnum.Empty));
  }

  PhoneNumber.create(super.value);
}
