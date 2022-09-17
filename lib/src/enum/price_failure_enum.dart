enum PriceFailureEnum {
  Empty,
  Invalid;

  T when<T>({
    required T Function() empty,
    required T Function() invalid,
  }) {
    switch (this) {
      case PriceFailureEnum.Empty:
        return empty();
      case PriceFailureEnum.Invalid:
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
