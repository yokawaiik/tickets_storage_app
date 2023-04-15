/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 54 (27 per locale)
///
/// Built on 2023-04-15 at 08:28 UTC

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
	late final _TranslationsErrorStringsEn errorStrings = _TranslationsErrorStringsEn._(_root);
	late final _TranslationsStringsEn strings = _TranslationsStringsEn._(_root);
}

// Path: errorStrings
class _TranslationsErrorStringsEn {
	_TranslationsErrorStringsEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get unexpected => 'Something went wron...';
}

// Path: strings
class _TranslationsStringsEn {
	_TranslationsStringsEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get appName => 'Tickets storage';
	late final _TranslationsStringsStoragePageEn storagePage = _TranslationsStringsStoragePageEn._(_root);
	late final _TranslationsStringsSettingsPageEn settingsPage = _TranslationsStringsSettingsPageEn._(_root);
	late final _TranslationsStringsValidatorsEn validators = _TranslationsStringsValidatorsEn._(_root);
}

// Path: strings.storagePage
class _TranslationsStringsStoragePageEn {
	_TranslationsStringsStoragePageEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	late final _TranslationsStringsStoragePageAppbarEn appbar = _TranslationsStringsStoragePageAppbarEn._(_root);
	late final _TranslationsStringsStoragePageSnakbarMessagesEn snakbarMessages = _TranslationsStringsStoragePageSnakbarMessagesEn._(_root);
	late final _TranslationsStringsStoragePageBodyEn body = _TranslationsStringsStoragePageBodyEn._(_root);
	late final _TranslationsStringsStoragePageFabEn fab = _TranslationsStringsStoragePageFabEn._(_root);
	late final _TranslationsStringsStoragePageBottomAppBarEn bottomAppBar = _TranslationsStringsStoragePageBottomAppBarEn._(_root);
	late final _TranslationsStringsStoragePageModalBottomSheetEn modalBottomSheet = _TranslationsStringsStoragePageModalBottomSheetEn._(_root);
}

// Path: strings.settingsPage
class _TranslationsStringsSettingsPageEn {
	_TranslationsStringsSettingsPageEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	late final _TranslationsStringsSettingsPageAppbarEn appbar = _TranslationsStringsSettingsPageAppbarEn._(_root);
	List<dynamic> get locales => [
		_TranslationsStringsSettingsPage$locales$0i0$En._(_root),
		_TranslationsStringsSettingsPage$locales$0i1$En._(_root),
		_TranslationsStringsSettingsPage$locales$0i2$En._(_root),
	];
}

// Path: strings.validators
class _TranslationsStringsValidatorsEn {
	_TranslationsStringsValidatorsEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String minLengthMessage({required Object minLength}) => 'This field must be more then ${minLength}.';
	String maxLengthMessage({required Object maxLength}) => 'This field must be less then ${maxLength}.';
	String get emptyLengthMessage => 'This field is required.';
	String get linkMessage => 'Link is wrong.';
	String get extensionMessage => 'Such a file isn\'t allowed.';
}

// Path: strings.storagePage.appbar
class _TranslationsStringsStoragePageAppbarEn {
	_TranslationsStringsStoragePageAppbarEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Tickets storage';
	late final _TranslationsStringsStoragePageAppbarPopupMenuButtonEn popupMenuButton = _TranslationsStringsStoragePageAppbarPopupMenuButtonEn._(_root);
}

// Path: strings.storagePage.snakbarMessages
class _TranslationsStringsStoragePageSnakbarMessagesEn {
	_TranslationsStringsStoragePageSnakbarMessagesEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String removedSingle({required Object fileUrl}) => 'Was deleted: ${fileUrl}.';
	String get removedSelected => 'Selected tickets were deleted.';
	String get unexpected => 'Something went wrong.';
}

// Path: strings.storagePage.body
class _TranslationsStringsStoragePageBodyEn {
	_TranslationsStringsStoragePageBodyEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get noMoreItems => 'There is nothing more...';
	late final _TranslationsStringsStoragePageBodyListTicketItemEn listTicketItem = _TranslationsStringsStoragePageBodyListTicketItemEn._(_root);
}

// Path: strings.storagePage.fab
class _TranslationsStringsStoragePageFabEn {
	_TranslationsStringsStoragePageFabEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get deleteSelected => 'Delete selected';
	String get add => 'Add';
}

// Path: strings.storagePage.bottomAppBar
class _TranslationsStringsStoragePageBottomAppBarEn {
	_TranslationsStringsStoragePageBottomAppBarEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	late final _TranslationsStringsStoragePageBottomAppBarSelectionEn selection = _TranslationsStringsStoragePageBottomAppBarSelectionEn._(_root);
}

// Path: strings.storagePage.modalBottomSheet
class _TranslationsStringsStoragePageModalBottomSheetEn {
	_TranslationsStringsStoragePageModalBottomSheetEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get fileUrlTextField => 'PDF file url';
	String get addButton => 'Add';
}

// Path: strings.settingsPage.appbar
class _TranslationsStringsSettingsPageAppbarEn {
	_TranslationsStringsSettingsPageAppbarEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
}

// Path: strings.settingsPage.locales.0
class _TranslationsStringsSettingsPage$locales$0i0$En {
	_TranslationsStringsSettingsPage$locales$0i0$En._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Auto';
}

// Path: strings.settingsPage.locales.1
class _TranslationsStringsSettingsPage$locales$0i1$En {
	_TranslationsStringsSettingsPage$locales$0i1$En._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'English';
}

// Path: strings.settingsPage.locales.2
class _TranslationsStringsSettingsPage$locales$0i2$En {
	_TranslationsStringsSettingsPage$locales$0i2$En._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Russian';
}

// Path: strings.storagePage.appbar.popupMenuButton
class _TranslationsStringsStoragePageAppbarPopupMenuButtonEn {
	_TranslationsStringsStoragePageAppbarPopupMenuButtonEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get settings => 'Settings';
}

// Path: strings.storagePage.body.listTicketItem
class _TranslationsStringsStoragePageBodyListTicketItemEn {
	_TranslationsStringsStoragePageBodyListTicketItemEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Ticket';
	String get subtitleFileDownloaded => 'File was downloaded';
	String get subtitleFileDownloading => 'Downloading';
	String get subtitleFileDownload => 'Pending downloading';
	String get subtitleFileError => 'Downloading error';
}

// Path: strings.storagePage.bottomAppBar.selection
class _TranslationsStringsStoragePageBottomAppBarSelectionEn {
	_TranslationsStringsStoragePageBottomAppBarSelectionEn._(this._root);

	final _TranslationsEn _root; // ignore: unused_field

	// Translations
	String get tooltip => 'Select group';
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
	@override late final _TranslationsErrorStringsRu errorStrings = _TranslationsErrorStringsRu._(_root);
	@override late final _TranslationsStringsRu strings = _TranslationsStringsRu._(_root);
}

// Path: errorStrings
class _TranslationsErrorStringsRu extends _TranslationsErrorStringsEn {
	_TranslationsErrorStringsRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Что-то пошло не так...';
}

// Path: strings
class _TranslationsStringsRu extends _TranslationsStringsEn {
	_TranslationsStringsRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Tickets storage';
	@override late final _TranslationsStringsStoragePageRu storagePage = _TranslationsStringsStoragePageRu._(_root);
	@override late final _TranslationsStringsSettingsPageRu settingsPage = _TranslationsStringsSettingsPageRu._(_root);
	@override late final _TranslationsStringsValidatorsRu validators = _TranslationsStringsValidatorsRu._(_root);
}

// Path: strings.storagePage
class _TranslationsStringsStoragePageRu extends _TranslationsStringsStoragePageEn {
	_TranslationsStringsStoragePageRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsStoragePageAppbarRu appbar = _TranslationsStringsStoragePageAppbarRu._(_root);
	@override late final _TranslationsStringsStoragePageSnakbarMessagesRu snakbarMessages = _TranslationsStringsStoragePageSnakbarMessagesRu._(_root);
	@override late final _TranslationsStringsStoragePageBodyRu body = _TranslationsStringsStoragePageBodyRu._(_root);
	@override late final _TranslationsStringsStoragePageFabRu fab = _TranslationsStringsStoragePageFabRu._(_root);
	@override late final _TranslationsStringsStoragePageBottomAppBarRu bottomAppBar = _TranslationsStringsStoragePageBottomAppBarRu._(_root);
	@override late final _TranslationsStringsStoragePageModalBottomSheetRu modalBottomSheet = _TranslationsStringsStoragePageModalBottomSheetRu._(_root);
}

// Path: strings.settingsPage
class _TranslationsStringsSettingsPageRu extends _TranslationsStringsSettingsPageEn {
	_TranslationsStringsSettingsPageRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsSettingsPageAppbarRu appbar = _TranslationsStringsSettingsPageAppbarRu._(_root);
	@override List<dynamic> get locales => [
		_TranslationsStringsSettingsPage$locales$0i0$Ru._(_root),
		_TranslationsStringsSettingsPage$locales$0i1$Ru._(_root),
		_TranslationsStringsSettingsPage$locales$0i2$Ru._(_root),
	];
}

// Path: strings.validators
class _TranslationsStringsValidatorsRu extends _TranslationsStringsValidatorsEn {
	_TranslationsStringsValidatorsRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String minLengthMessage({required Object minLength}) => 'Значение должно быть не менее ${minLength} символов.';
	@override String maxLengthMessage({required Object maxLength}) => 'Значение должно быть не более ${maxLength} символов.';
	@override String get emptyLengthMessage => 'Это поле должно быть заполнено.';
	@override String get linkMessage => 'Ссылка не корректна.';
	@override String get extensionMessage => 'Файлы с таким расширением не разрешены.';
}

// Path: strings.storagePage.appbar
class _TranslationsStringsStoragePageAppbarRu extends _TranslationsStringsStoragePageAppbarEn {
	_TranslationsStringsStoragePageAppbarRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Хранилище билетов';
	@override late final _TranslationsStringsStoragePageAppbarPopupMenuButtonRu popupMenuButton = _TranslationsStringsStoragePageAppbarPopupMenuButtonRu._(_root);
}

// Path: strings.storagePage.snakbarMessages
class _TranslationsStringsStoragePageSnakbarMessagesRu extends _TranslationsStringsStoragePageSnakbarMessagesEn {
	_TranslationsStringsStoragePageSnakbarMessagesRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String removedSingle({required Object fileUrl}) => 'Удален: ${fileUrl}.';
	@override String get removedSelected => 'Выбранные билеты были удалены.';
	@override String get unexpected => 'Что-то пошло не так.';
}

// Path: strings.storagePage.body
class _TranslationsStringsStoragePageBodyRu extends _TranslationsStringsStoragePageBodyEn {
	_TranslationsStringsStoragePageBodyRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get noMoreItems => 'Больше ничего нет...';
	@override late final _TranslationsStringsStoragePageBodyListTicketItemRu listTicketItem = _TranslationsStringsStoragePageBodyListTicketItemRu._(_root);
}

// Path: strings.storagePage.fab
class _TranslationsStringsStoragePageFabRu extends _TranslationsStringsStoragePageFabEn {
	_TranslationsStringsStoragePageFabRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get deleteSelected => 'Удалить выбранные';
	@override String get add => 'Добавить';
}

// Path: strings.storagePage.bottomAppBar
class _TranslationsStringsStoragePageBottomAppBarRu extends _TranslationsStringsStoragePageBottomAppBarEn {
	_TranslationsStringsStoragePageBottomAppBarRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsStringsStoragePageBottomAppBarSelectionRu selection = _TranslationsStringsStoragePageBottomAppBarSelectionRu._(_root);
}

// Path: strings.storagePage.modalBottomSheet
class _TranslationsStringsStoragePageModalBottomSheetRu extends _TranslationsStringsStoragePageModalBottomSheetEn {
	_TranslationsStringsStoragePageModalBottomSheetRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get fileUrlTextField => 'Ссылка на PDF файл';
	@override String get addButton => 'Добавить';
}

// Path: strings.settingsPage.appbar
class _TranslationsStringsSettingsPageAppbarRu extends _TranslationsStringsSettingsPageAppbarEn {
	_TranslationsStringsSettingsPageAppbarRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
}

// Path: strings.settingsPage.locales.0
class _TranslationsStringsSettingsPage$locales$0i0$Ru extends _TranslationsStringsSettingsPage$locales$0i0$En {
	_TranslationsStringsSettingsPage$locales$0i0$Ru._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Язык устройства';
}

// Path: strings.settingsPage.locales.1
class _TranslationsStringsSettingsPage$locales$0i1$Ru extends _TranslationsStringsSettingsPage$locales$0i1$En {
	_TranslationsStringsSettingsPage$locales$0i1$Ru._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'English';
}

// Path: strings.settingsPage.locales.2
class _TranslationsStringsSettingsPage$locales$0i2$Ru extends _TranslationsStringsSettingsPage$locales$0i2$En {
	_TranslationsStringsSettingsPage$locales$0i2$Ru._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Русский';
}

// Path: strings.storagePage.appbar.popupMenuButton
class _TranslationsStringsStoragePageAppbarPopupMenuButtonRu extends _TranslationsStringsStoragePageAppbarPopupMenuButtonEn {
	_TranslationsStringsStoragePageAppbarPopupMenuButtonRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Настройки';
}

// Path: strings.storagePage.body.listTicketItem
class _TranslationsStringsStoragePageBodyListTicketItemRu extends _TranslationsStringsStoragePageBodyListTicketItemEn {
	_TranslationsStringsStoragePageBodyListTicketItemRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Билет';
	@override String get subtitleFileDownloaded => 'Файл загружен';
	@override String get subtitleFileDownloading => 'Загрузка';
	@override String get subtitleFileDownload => 'Ожидание загрузки';
	@override String get subtitleFileError => 'Ошибка при загрузке';
}

// Path: strings.storagePage.bottomAppBar.selection
class _TranslationsStringsStoragePageBottomAppBarSelectionRu extends _TranslationsStringsStoragePageBottomAppBarSelectionEn {
	_TranslationsStringsStoragePageBottomAppBarSelectionRu._(_TranslationsRu root) : this._root = root, super._(root);

	@override final _TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get tooltip => 'Выбрать несколько';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'errorStrings.unexpected': return 'Something went wron...';
			case 'strings.appName': return 'Tickets storage';
			case 'strings.storagePage.appbar.title': return 'Tickets storage';
			case 'strings.storagePage.appbar.popupMenuButton.settings': return 'Settings';
			case 'strings.storagePage.snakbarMessages.removedSingle': return ({required Object fileUrl}) => 'Was deleted: ${fileUrl}.';
			case 'strings.storagePage.snakbarMessages.removedSelected': return 'Selected tickets were deleted.';
			case 'strings.storagePage.snakbarMessages.unexpected': return 'Something went wrong.';
			case 'strings.storagePage.body.noMoreItems': return 'There is nothing more...';
			case 'strings.storagePage.body.listTicketItem.title': return 'Ticket';
			case 'strings.storagePage.body.listTicketItem.subtitleFileDownloaded': return 'File was downloaded';
			case 'strings.storagePage.body.listTicketItem.subtitleFileDownloading': return 'Downloading';
			case 'strings.storagePage.body.listTicketItem.subtitleFileDownload': return 'Pending downloading';
			case 'strings.storagePage.body.listTicketItem.subtitleFileError': return 'Downloading error';
			case 'strings.storagePage.fab.deleteSelected': return 'Delete selected';
			case 'strings.storagePage.fab.add': return 'Add';
			case 'strings.storagePage.bottomAppBar.selection.tooltip': return 'Select group';
			case 'strings.storagePage.modalBottomSheet.fileUrlTextField': return 'PDF file url';
			case 'strings.storagePage.modalBottomSheet.addButton': return 'Add';
			case 'strings.settingsPage.appbar.title': return 'Settings';
			case 'strings.settingsPage.locales.0.title': return 'Auto';
			case 'strings.settingsPage.locales.1.title': return 'English';
			case 'strings.settingsPage.locales.2.title': return 'Russian';
			case 'strings.validators.minLengthMessage': return ({required Object minLength}) => 'This field must be more then ${minLength}.';
			case 'strings.validators.maxLengthMessage': return ({required Object maxLength}) => 'This field must be less then ${maxLength}.';
			case 'strings.validators.emptyLengthMessage': return 'This field is required.';
			case 'strings.validators.linkMessage': return 'Link is wrong.';
			case 'strings.validators.extensionMessage': return 'Such a file isn\'t allowed.';
			default: return null;
		}
	}
}

extension on _TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'errorStrings.unexpected': return 'Что-то пошло не так...';
			case 'strings.appName': return 'Tickets storage';
			case 'strings.storagePage.appbar.title': return 'Хранилище билетов';
			case 'strings.storagePage.appbar.popupMenuButton.settings': return 'Настройки';
			case 'strings.storagePage.snakbarMessages.removedSingle': return ({required Object fileUrl}) => 'Удален: ${fileUrl}.';
			case 'strings.storagePage.snakbarMessages.removedSelected': return 'Выбранные билеты были удалены.';
			case 'strings.storagePage.snakbarMessages.unexpected': return 'Что-то пошло не так.';
			case 'strings.storagePage.body.noMoreItems': return 'Больше ничего нет...';
			case 'strings.storagePage.body.listTicketItem.title': return 'Билет';
			case 'strings.storagePage.body.listTicketItem.subtitleFileDownloaded': return 'Файл загружен';
			case 'strings.storagePage.body.listTicketItem.subtitleFileDownloading': return 'Загрузка';
			case 'strings.storagePage.body.listTicketItem.subtitleFileDownload': return 'Ожидание загрузки';
			case 'strings.storagePage.body.listTicketItem.subtitleFileError': return 'Ошибка при загрузке';
			case 'strings.storagePage.fab.deleteSelected': return 'Удалить выбранные';
			case 'strings.storagePage.fab.add': return 'Добавить';
			case 'strings.storagePage.bottomAppBar.selection.tooltip': return 'Выбрать несколько';
			case 'strings.storagePage.modalBottomSheet.fileUrlTextField': return 'Ссылка на PDF файл';
			case 'strings.storagePage.modalBottomSheet.addButton': return 'Добавить';
			case 'strings.settingsPage.appbar.title': return 'Настройки';
			case 'strings.settingsPage.locales.0.title': return 'Язык устройства';
			case 'strings.settingsPage.locales.1.title': return 'English';
			case 'strings.settingsPage.locales.2.title': return 'Русский';
			case 'strings.validators.minLengthMessage': return ({required Object minLength}) => 'Значение должно быть не менее ${minLength} символов.';
			case 'strings.validators.maxLengthMessage': return ({required Object maxLength}) => 'Значение должно быть не более ${maxLength} символов.';
			case 'strings.validators.emptyLengthMessage': return 'Это поле должно быть заполнено.';
			case 'strings.validators.linkMessage': return 'Ссылка не корректна.';
			case 'strings.validators.extensionMessage': return 'Файлы с таким расширением не разрешены.';
			default: return null;
		}
	}
}
