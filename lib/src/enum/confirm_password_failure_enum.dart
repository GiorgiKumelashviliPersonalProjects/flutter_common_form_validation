enum ConfirmPasswordFailureEnum {
  Empty,
  DoesNotMatch;

  T when<T>({
    required T Function() empty,
    required T Function() doesNotMatch,
  }) {
    switch (this) {
      case ConfirmPasswordFailureEnum.Empty:
        return empty();
      case ConfirmPasswordFailureEnum.DoesNotMatch:
        return doesNotMatch();
      default:
        return empty();
    }
  }

  T maybeWhen<T>({
    required T Function() orElse,
    T Function()? empty,
    T Function()? doesNotMatch,
  }) {
    return when(
      empty: empty ?? orElse,
      doesNotMatch: doesNotMatch ?? orElse,
    );
  }
}
