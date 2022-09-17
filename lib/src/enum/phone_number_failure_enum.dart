enum PhoneNumberFailureEnum {
  Empty,
  Invalid;

  T when<T>({
    required T Function() empty,
    required T Function() invalid,
  }) {
    switch (this) {
      case PhoneNumberFailureEnum.Empty:
        return empty();
      case PhoneNumberFailureEnum.Invalid:
        return invalid();
      default:
        return empty();
    }
  }

  T maybeWhen<T>({
    required T Function() orElse,
    T Function()? empty,
    T Function()? invalid,
  }) {
    return when(
      empty: empty ?? orElse,
      invalid: invalid ?? orElse,
    );
  }
}
