/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 12 (6 per locale)
///
/// Built on 2023-04-14 at 18:10 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _TranslationsEn> {
	en(languageCode: 'en', build: _TranslationsEn.build),
	ru(languageCode: 'ru', build: _TranslationsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _TranslationsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_TranslationsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_TranslationsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _TranslationsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _TranslationsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _TranslationsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _TranslationsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_TranslationsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _TranslationsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _TranslationsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _TranslationsEn implements BaseTranslations<AppLocale, _TranslationsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _TranslationsEn _root = this; // ignore: unused_field

	// Translations
	String get appName => 'Tickets storage';
	late final _TranslationsStoragePageEn storagePage = _TranslationsStoragePageEn._(_root);
	late final _TranslationsSettingsPageEn settingsPage = _TranslationsSettingsPageEn._(_root);
}

// Path: storagePage
class _TranslationsStoragePageEn {
	_TranslationsStoragePageEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	late final _TranslationsStoragePageAppbarEn appbar = _TranslationsStoragePageAppbarEn._(_root);
}

// Path: settingsPage
class _TranslationsSettingsPageEn {
	_TranslationsSettingsPageEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	late final _TranslationsSettingsPageAppbarEn appbar = _TranslationsSettingsPageAppbarEn._(_root);
	List<dynamic> get locales => [
		_TranslationsSettingsPage$locales$0i0$En._(_root),
		_TranslationsSettingsPage$locales$0i1$En._(_root),
		_TranslationsSettingsPage$locales$0i2$En._(_root),
	];
}

// Path: storagePage.appbar
class _TranslationsStoragePageAppbarEn {
	_TranslationsStoragePageAppbarEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Tickets storage';
}

// Path: settingsPage.appbar
class _TranslationsSettingsPageAppbarEn {
	_TranslationsSettingsPageAppbarEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
}

// Path: settingsPage.locales.0
class _TranslationsSettingsPage$locales$0i0$En {
	_TranslationsSettingsPage$locales$0i0$En._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Auto';
}

// Path: settingsPage.locales.1
class _TranslationsSettingsPage$locales$0i1$En {
	_TranslationsSettingsPage$locales$0i1$En._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'English';
}

// Path: settingsPage.locales.2
class _TranslationsSettingsPage$locales$0i2$En {
	_TranslationsSettingsPage$locales$0i2$En._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Russian';
}

// Path: <root>
class _TranslationsRu extends _TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super.build(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, _TranslationsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final _TranslationsRu _root = this; // ignore: unused_field

	// Translations
	@override String get appName => 'Tickets storage';
	@override late final _TranslationsStoragePageRu storagePage = _TranslationsStoragePageRu._(_root);
	@override late final _TranslationsSettingsPageRu settingsPage = _TranslationsSettingsPageRu._(_root);
}

// Path: storagePage
class _TranslationsStoragePageRu extends _TranslationsStoragePageEn {
	_TranslationsStoragePageRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStoragePageAppbarRu appbar = _TranslationsStoragePageAppbarRu._(_root);
}

// Path: settingsPage
class _TranslationsSettingsPageRu extends _TranslationsSettingsPageEn {
	_TranslationsSettingsPageRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPageAppbarRu appbar = _TranslationsSettingsPageAppbarRu._(_root);
	@override List<dynamic> get locales => [
		_TranslationsSettingsPage$locales$0i0$Ru._(_root),
		_TranslationsSettingsPage$locales$0i1$Ru._(_root),
		_TranslationsSettingsPage$locales$0i2$Ru._(_root),
	];
}

// Path: storagePage.appbar
class _TranslationsStoragePageAppbarRu extends _TranslationsStoragePageAppbarEn {
	_TranslationsStoragePageAppbarRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Хранилище билетов';
}

// Path: settingsPage.appbar
class _TranslationsSettingsPageAppbarRu extends _TranslationsSettingsPageAppbarEn {
	_TranslationsSettingsPageAppbarRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
}

// Path: settingsPage.locales.0
class _TranslationsSettingsPage$locales$0i0$Ru extends _TranslationsSettingsPage$locales$0i0$En {
	_TranslationsSettingsPage$locales$0i0$Ru._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Автоматически';
}

// Path: settingsPage.locales.1
class _TranslationsSettingsPage$locales$0i1$Ru extends _TranslationsSettingsPage$locales$0i1$En {
	_TranslationsSettingsPage$locales$0i1$Ru._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'English';
}

// Path: settingsPage.locales.2
class _TranslationsSettingsPage$locales$0i2$Ru extends _TranslationsSettingsPage$locales$0i2$En {
	_TranslationsSettingsPage$locales$0i2$Ru._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Русский';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Tickets storage';
			case 'storagePage.appbar.title': return 'Tickets storage';
			case 'settingsPage.appbar.title': return 'Settings';
			case 'settingsPage.locales.0.title': return 'Auto';
			case 'settingsPage.locales.1.title': return 'English';
			case 'settingsPage.locales.2.title': return 'Russian';
			default: return null;
		}
	}
}

extension on _TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'Tickets storage';
			case 'storagePage.appbar.title': return 'Хранилище билетов';
			case 'settingsPage.appbar.title': return 'Настройки';
			case 'settingsPage.locales.0.title': return 'Автоматически';
			case 'settingsPage.locales.1.title': return 'English';
			case 'settingsPage.locales.2.title': return 'Русский';
			default: return null;
		}
	}
}
