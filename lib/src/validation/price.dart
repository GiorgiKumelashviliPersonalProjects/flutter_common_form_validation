import '../enum/price_failure_enum.dart';
import '../utils/either.dart';
import '../utils/value_object.dart';

class Price extends ValueObject<PriceFailureEnum, double> {
  factory Price(String value) {
    final double? priceValue = double.tryParse(value);

    if (value.trim().isEmpty) {
      return Price.create(left(PriceFailureEnum.Empty));
    }

    if (priceValue == null || priceValue.isNaN || priceValue < 0) {
      return Price.create(left(PriceFailureEnum.Invalid));
    }

    return Price.create(right(priceValue));
  }

  factory Price.empty() {
    return Price.create(left(PriceFailureEnum.Empty));
  }

  Price.create(super.value);
}
