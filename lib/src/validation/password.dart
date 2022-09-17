import '../config/vvo_config.dart';
import '../enum/password_failure_enum.dart';
import '../utils/either.dart';
import '../utils/value_object.dart';

class Password extends ValueObject<PasswordFailureEnum, String> {
  factory Password(String value) {
    if (value.isEmpty) {
      return Password.create(left(PasswordFailureEnum.Empty));
    }

    // Check minimum length of password
    if (value.length < VVOConfig.password.minLength) {
      return Password.create(left(PasswordFailureEnum.TooShort));
    }

    // Check for atleast one uppercase word
    if (VVOConfig.password.checkForUppercase && !value.contains(VVOConfig.password.patternUppercase)) {
      return Password.create(left(PasswordFailureEnum.NoUppercaseCharsFound));
    }

    // Check for atleast one lowercase word
    if (VVOConfig.password.checkForLowercase && !value.contains(VVOConfig.password.patternLowercase)) {
      return Password.create(left(PasswordFailureEnum.NoLowercaseCharsFound));
    }

    // Check for atleast one digit
    if (VVOConfig.password.checkForDigits && !value.contains(VVOConfig.password.patternDigits)) {
      return Password.create(left(PasswordFailureEnum.NoDigitsFound));
    }

    // Check for atleast one special character
    if (VVOConfig.password.checkForSpecialCharacters &&
        !value.contains(VVOConfig.password.patternSpecialCharacters)) {
      return Password.create(left(PasswordFailureEnum.NoSpecialCharsFound));
    }

    return Password.create(right(value));
  }

  factory Password.empty() {
    return Password.create(left(PasswordFailureEnum.Empty));
  }

  Password.create(Either<PasswordFailureEnum, String> value) : super(value);
}
