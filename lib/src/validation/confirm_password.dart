import '../enum/confirm_password_failure_enum.dart';
import '../utils/either.dart';
import '../utils/value_object.dart';

class ConfirmPassword extends ValueObject<ConfirmPasswordFailureEnum, String> {
  factory ConfirmPassword(String password, String repeatedPassword) {
    if (repeatedPassword.isEmpty) {
      return ConfirmPassword.create(
        left(ConfirmPasswordFailureEnum.Empty),
      );
    }

    if (password != repeatedPassword) {
      return ConfirmPassword.create(
        left(ConfirmPasswordFailureEnum.DoesNotMatch),
      );
    }

    return ConfirmPassword.create(right(repeatedPassword));
  }

  factory ConfirmPassword.empty() {
    return ConfirmPassword.create(left(ConfirmPasswordFailureEnum.Empty));
  }

  ConfirmPassword.create(Either<ConfirmPasswordFailureEnum, String> value) : super(value);
}
