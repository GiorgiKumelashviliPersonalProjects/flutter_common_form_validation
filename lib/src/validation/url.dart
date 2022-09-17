import '../config/vvo_config.dart';
import '../enum/url_failure_enum.dart';
import '../utils/either.dart';
import '../utils/value_object.dart';

class Url extends ValueObject<UrlFailureEnum, String> {
  factory Url(String url) {
    if (url.isEmpty) {
      return Url.create(left(UrlFailureEnum.Empty));
    }

    if (!VVOConfig.url.urlPattern.hasMatch(url)) {
      return Url.create(left(UrlFailureEnum.Invalid));
    }

    return Url.create(right(url));
  }

  factory Url.empty() {
    return Url.create(left(UrlFailureEnum.Empty));
  }

  Url.create(super.value);
}
