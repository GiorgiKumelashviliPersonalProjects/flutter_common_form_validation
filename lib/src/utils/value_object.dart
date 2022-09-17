import 'either.dart';

/// base of a validated value object
/// holds either a value of type [T] or a failure from validation of type [F]
abstract class ValueObject<F, T> {
  const ValueObject(this.value);

  final Either<F, T> value;

  /// @returns value if [value] is valid, null otherwise
  T? get get => value.fold((F l) => null, (T r) => r);

  T getOrElse(T orElse) => value.getOrElse(() => orElse);

  /// @returns value [T] if present
  /// @throws [Exception] if value isn't valid
  T get getOrThrow {
    return value.fold(
      (F l) => throw Exception('getOrThrow called with failure'),
      (T t) => t,
    );
  }

  bool get valid => value.isRight();

  bool get invalid => value.isLeft();

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'ValueObject{$value}';

  @override
  bool operator ==(Object o) {
    return identical(this, o) || o is ValueObject<F, T> && o.value == value;
  }
}
