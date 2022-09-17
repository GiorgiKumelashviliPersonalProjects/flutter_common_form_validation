// ignore_for_file: constant_identifier_names

enum VerificationCodeFailureEnum {
  Empty,
  Invalid,
  TooShort,

  NoUppercaseCharsFound,
  NoLowercaseCharsFound,
  NoDigitsFound,
  NoSpecialCharsFound,

  OutOfRange,

  DoesNotMatch,
}
