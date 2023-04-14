import 'package:documents_saver_app/src/features/settings/data/storage/settings_storage.dart';
import 'package:documents_saver_app/src/features/settings/domain/enums/locale_variant.dart';

import '../../../../i18n/translations.g.dart';
import '../../data/constants/constants.dart' as constants;
import '../../utils/utils.dart';

class SettingsRepository {
  late final SettingsStorage _settingsStorage;

  SettingsRepository() {
    _settingsStorage = SettingsStorage();
  }

  Future<LocaleVariant> getLocale() async {
    final sp = await _settingsStorage.sharedPreferences;
    final localeIndex = sp.getInt(constants.localeKey) ?? 0;
    return indexToLocaleVariant(localeIndex);
  }

  Future<LocaleVariant> setLocale(LocaleVariant localeVariant) async {
    final sp = await _settingsStorage.sharedPreferences;

    await sp.setInt(constants.localeKey, localeVariant.index);

    return localeVariant;
  }
}
