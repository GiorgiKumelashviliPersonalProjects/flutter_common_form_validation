enum SimpleValueFailureEnum {
  Empty;

  T when<T>({required T Function() empty}) {
    switch (this) {
      case SimpleValueFailureEnum.Empty:
        return empty();
      default:
        return empty();
    }
  }

  T maybeWhen<T>({
    required T Function() orElse,
    T Function()? empty,
  }) {
    return when(empty: empty ?? orElse);
  }
}
