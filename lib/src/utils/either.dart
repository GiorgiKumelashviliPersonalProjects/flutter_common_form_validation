A _id<A>(A a) => a;

abstract class Either<L, R> {
  const Either();

  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight);

  R getOrElse(R Function() dflt) => fold((_) => dflt(), _id);

  bool isLeft() => fold((_) => true, (_) => false);

  bool isRight() => fold((_) => false, (_) => true);
}

class _Left<L, R> extends Either<L, R> {
  const _Left(this._l);

  final L _l;

  L get value => _l;

  @override
  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight) => ifLeft(_l);
}

class _Right<L, R> extends Either<L, R> {
  const _Right(this._r);

  final R _r;

  R get value => _r;

  @override
  B fold<B>(B Function(L l) ifLeft, B Function(R r) ifRight) => ifRight(_r);
}

Either<L, R> left<L, R>(L l) => _Left<L, R>(l);
Either<L, R> right<L, R>(R r) => _Right<L, R>(r);
