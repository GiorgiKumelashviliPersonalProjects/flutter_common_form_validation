import '../config/vvo_config.dart';
import '../enum/email_failure_enum.dart';
import '../utils/either.dart';
import '../utils/value_object.dart';

class Email extends ValueObject<EmailFailureEnum, String> {
  factory Email(String email) {
    if (email.isEmpty) {
      return Email.create(left(EmailFailureEnum.Empty));
    }

    if (!VVOConfig.email.emailPattern.hasMatch(email)) {
      return Email.create(left(EmailFailureEnum.Invalid));
    }

    return Email.create(right(email));
  }

  factory Email.empty() {
    return Email.create(left(EmailFailureEnum.Empty));
  }

  Email.create(Either<EmailFailureEnum, String> value) : super(value);
}
