import 'package:documents_saver_app/src/features/settings/domain/enums/locale_variant.dart';

LocaleVariant indexToLocaleVariant(int index) {
  late final LocaleVariant locale;

  switch (index) {
    case 0:
      locale = LocaleVariant.auto;
      break;
    case 1:
      locale = LocaleVariant.en;
      break;
    case 2:
      locale = LocaleVariant.ru;
      break;
    default:
      locale = LocaleVariant.auto;
  }

  return locale;
}
