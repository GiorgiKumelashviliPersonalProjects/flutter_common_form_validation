enum NameFailureEnum {
  Empty,
  TooShort;

  T when<T>({
    required T Function() empty,
    required T Function() tooShort,
  }) {
    switch (this) {
      case NameFailureEnum.Empty:
        return empty();
      case NameFailureEnum.TooShort:
        return tooShort();
      default:
        return empty();
    }
  }

  T maybeWhen<T>({
    required T Function() orElse,
    T Function()? empty,
    T Function()? tooShort,
  }) {
    return when(
      empty: empty ?? orElse,
      tooShort: tooShort ?? orElse,
    );
  }
}
