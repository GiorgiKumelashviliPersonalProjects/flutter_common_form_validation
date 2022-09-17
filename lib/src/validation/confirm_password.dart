import '../enum/confirm_password_failure_enum.dart';
import '../utils/either.dart';
import '../utils/value_object.dart';

class ConfirmPassword extends ValueObject<ConfirmPasswordFailureEnum, String> {
  factory ConfirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isEmpty) {
      return ConfirmPassword.create(
        left(ConfirmPasswordFailureEnum.Empty),
      );
    }

    if (password != confirmPassword) {
      return ConfirmPassword.create(
        left(ConfirmPasswordFailureEnum.DoesNotMatch),
      );
    }

    return ConfirmPassword.create(right(confirmPassword));
  }

  factory ConfirmPassword.empty() {
    return ConfirmPassword.create(left(ConfirmPasswordFailureEnum.Empty));
  }

  ConfirmPassword.create(super.value);
}
