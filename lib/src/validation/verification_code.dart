import '../config/vvo_config.dart';
import '../enum/verification_code_failure_enum.dart';
import '../utils/either.dart';
import '../utils/value_object.dart';

class VerificationCode extends ValueObject<VerificationCodeFailureEnum, String> {
  factory VerificationCode(String verificationCode) {
    if (verificationCode.isEmpty) {
      return VerificationCode.create(left(VerificationCodeFailureEnum.Empty));
    }

    if (verificationCode.length != VVOConfig.verificationCode.length) {
      return VerificationCode.create(left(VerificationCodeFailureEnum.Invalid));
    }

    return VerificationCode.create(right(verificationCode));
  }

  factory VerificationCode.empty() {
    return VerificationCode.create(left(VerificationCodeFailureEnum.Empty));
  }

  VerificationCode.create(super.value);
}
