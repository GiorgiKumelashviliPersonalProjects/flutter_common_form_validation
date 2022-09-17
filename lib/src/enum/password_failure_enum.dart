enum PasswordFailureEnum {
  Empty,
  TooShort,
  NoUppercaseCharsFound,
  NoLowercaseCharsFound,
  NoDigitsFound,
  NoSpecialCharsFound;

  T when<T>({
    required T Function() empty,
    required T Function() tooShort,
    required T Function() noUppercaseCharsFound,
    required T Function() noLowercaseCharsFound,
    required T Function() noDigitsFound,
    required T Function() noSpecialCharsFound,
  }) {
    switch (this) {
      case PasswordFailureEnum.Empty:
        return empty();
      case PasswordFailureEnum.TooShort:
        return tooShort();
      case PasswordFailureEnum.NoUppercaseCharsFound:
        return noUppercaseCharsFound();
      case PasswordFailureEnum.NoLowercaseCharsFound:
        return noLowercaseCharsFound();
      case PasswordFailureEnum.NoDigitsFound:
        return noDigitsFound();
      case PasswordFailureEnum.NoSpecialCharsFound:
        return noSpecialCharsFound();
      default:
        return empty();
    }
  }

  T maybeWhen<T>({
    required T Function() orElse,
    T Function()? empty,
    T Function()? tooShort,
    T Function()? noUppercaseCharsFound,
    T Function()? noLowercaseCharsFound,
    T Function()? noDigitsFound,
    T Function()? noSpecialCharsFound,
  }) {
    return when(
      empty: empty ?? orElse,
      tooShort: tooShort ?? orElse,
      noUppercaseCharsFound: noUppercaseCharsFound ?? orElse,
      noLowercaseCharsFound: noLowercaseCharsFound ?? orElse,
      noDigitsFound: noDigitsFound ?? orElse,
      noSpecialCharsFound: noSpecialCharsFound ?? orElse,
    );
  }
}
