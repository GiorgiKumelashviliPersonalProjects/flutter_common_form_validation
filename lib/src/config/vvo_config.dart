class VVOConfig {
  static _EmailVVOConfig email = _EmailVVOConfig();
  static _PasswordVVOConfig password = _PasswordVVOConfig();
  static _NameVVOConfig name = _NameVVOConfig();
  static _VerificationCodeConfig verificationCode = _VerificationCodeConfig();
  static _PhoneNuberVVOConfig phoneNuber = _PhoneNuberVVOConfig();
  static _UrlVVOConfig url = _UrlVVOConfig();
}

class _EmailVVOConfig {
  RegExp emailPattern = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
}

class _PasswordVVOConfig {
  int minLength = 4;
  bool checkForUppercase = false;
  bool checkForLowercase = false;
  bool checkForDigits = false;
  bool checkForSpecialCharacters = false;

  Pattern patternUppercase = RegExp('[A-Z]');
  Pattern patternLowercase = RegExp('[a-z]');
  Pattern patternDigits = RegExp('[0-9]');
  Pattern patternSpecialCharacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
}

class _NameVVOConfig {
  int minLength = 0;
}

class _VerificationCodeConfig {
  int length = 4;
}

class _PhoneNuberVVOConfig {
  RegExp patternPhoneNumber = RegExp(r'^(995)?\d{9}$');
}

class _UrlVVOConfig {
  RegExp urlPattern = RegExp(
    r'^https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
  );
}
