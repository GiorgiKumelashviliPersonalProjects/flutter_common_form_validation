enum EmailFailureEnum {
  Empty,
  Invalid;

  T when<T>({
    required T Function() empty,
    required T Function() invalid,
  }) {
    switch (this) {
      case EmailFailureEnum.Empty:
        return empty();
      case EmailFailureEnum.Invalid:
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
