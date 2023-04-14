import 'package:documents_saver_app/src/i18n/translations.g.dart';

AppLocale indexToAppLocale(int index) {
  late final AppLocale locale;

  switch (index) {
    case 0:
      locale = AppLocaleUtils.findDeviceLocale();
      break;
    case 1:
      locale = AppLocale.en;
      break;
    case 2:
      locale = AppLocale.ru;
      break;
    default:
      locale = AppLocale.en;
  }

  return locale;
}
