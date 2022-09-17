enum PercentFailureEnum {
  Empty,
  Invalid,
  OutOfRange;

  T when<T>({
    required T Function() empty,
    required T Function() invalid,
    required T Function() outOfRange,
  }) {
    switch (this) {
      case PercentFailureEnum.Empty:
        return empty();
      case PercentFailureEnum.Invalid:
        return invalid();
      case PercentFailureEnum.OutOfRange:
        return outOfRange();
      default:
        return empty();
    }
  }

  T maybeWhen<T>({
    required T Function() orElse,
    T Function()? empty,
    T Function()? invalid,
    T Function()? outOfRange,
  }) {
    return when(
      empty: empty ?? orElse,
      invalid: invalid ?? orElse,
      outOfRange: outOfRange ?? orElse,
    );
  }
}
