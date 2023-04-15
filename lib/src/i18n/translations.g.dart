/// Generated file. Do not edit.
///
/// Locales: 2
/// Strings: 85 (42 per locale)
///
/// Built on 2023-04-15 at 12:53 UTC

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
enum AppLocale with BaseAppLocale<AppLocale, TranslationsEn> {
	en(languageCode: 'en', build: TranslationsEn.build),
	ru(languageCode: 'ru', build: TranslationsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, TranslationsEn> build;
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, TranslationsEn> {
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
class TranslationsEn implements BaseTranslations<AppLocale, TranslationsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	@override final TranslationMetadata<AppLocale, TranslationsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	// Translations
	late final TranslationsErrorStringsEn errorStrings = TranslationsErrorStringsEn._(_root);
	late final TranslationsStringsEn strings = TranslationsStringsEn._(_root);
}

// Path: errorStrings
class TranslationsErrorStringsEn {
	TranslationsErrorStringsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get unexpected => 'Something went wron...';
	late final TranslationsErrorStringsFeaturesEn features = TranslationsErrorStringsFeaturesEn._(_root);
}

// Path: strings
class TranslationsStringsEn {
	TranslationsStringsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get appName => 'Tickets storage';
	late final TranslationsStringsStoragePageEn storagePage = TranslationsStringsStoragePageEn._(_root);
	late final TranslationsStringsSettingsPageEn settingsPage = TranslationsStringsSettingsPageEn._(_root);
	late final TranslationsStringsValidatorsEn validators = TranslationsStringsValidatorsEn._(_root);
}

// Path: errorStrings.features
class TranslationsErrorStringsFeaturesEn {
	TranslationsErrorStringsFeaturesEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	late final TranslationsErrorStringsFeaturesTicketStorageEn ticketStorage = TranslationsErrorStringsFeaturesTicketStorageEn._(_root);
}

// Path: strings.storagePage
class TranslationsStringsStoragePageEn {
	TranslationsStringsStoragePageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	late final TranslationsStringsStoragePageAppbarEn appbar = TranslationsStringsStoragePageAppbarEn._(_root);
	late final TranslationsStringsStoragePageSnakbarMessagesEn snakbarMessages = TranslationsStringsStoragePageSnakbarMessagesEn._(_root);
	late final TranslationsStringsStoragePageBodyEn body = TranslationsStringsStoragePageBodyEn._(_root);
	late final TranslationsStringsStoragePageFabEn fab = TranslationsStringsStoragePageFabEn._(_root);
	late final TranslationsStringsStoragePageBottomAppBarEn bottomAppBar = TranslationsStringsStoragePageBottomAppBarEn._(_root);
	late final TranslationsStringsStoragePageModalBottomSheetEn modalBottomSheet = TranslationsStringsStoragePageModalBottomSheetEn._(_root);
}

// Path: strings.settingsPage
class TranslationsStringsSettingsPageEn {
	TranslationsStringsSettingsPageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	late final TranslationsStringsSettingsPageAppbarEn appbar = TranslationsStringsSettingsPageAppbarEn._(_root);
	List<dynamic> get locales => [
		TranslationsStringsSettingsPage$locales$0i0$En._(_root),
		TranslationsStringsSettingsPage$locales$0i1$En._(_root),
		TranslationsStringsSettingsPage$locales$0i2$En._(_root),
	];
}

// Path: strings.validators
class TranslationsStringsValidatorsEn {
	TranslationsStringsValidatorsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String minLengthMessage({required Object minLength}) => 'This field must be more then ${minLength}.';
	String maxLengthMessage({required Object maxLength}) => 'This field must be less then ${maxLength}.';
	String get emptyLengthMessage => 'This field is required.';
	String get linkMessage => 'Link is wrong.';
	String get extensionMessage => 'Such a file isn\'t allowed.';
}

// Path: errorStrings.features.ticketStorage
class TranslationsErrorStringsFeaturesTicketStorageEn {
	TranslationsErrorStringsFeaturesTicketStorageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	late final TranslationsErrorStringsFeaturesTicketStorageRepositoriesEn repositories = TranslationsErrorStringsFeaturesTicketStorageRepositoriesEn._(_root);
	late final TranslationsErrorStringsFeaturesTicketStoragePresentationEn presentation = TranslationsErrorStringsFeaturesTicketStoragePresentationEn._(_root);
}

// Path: strings.storagePage.appbar
class TranslationsStringsStoragePageAppbarEn {
	TranslationsStringsStoragePageAppbarEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Tickets storage';
	late final TranslationsStringsStoragePageAppbarPopupMenuButtonEn popupMenuButton = TranslationsStringsStoragePageAppbarPopupMenuButtonEn._(_root);
}

// Path: strings.storagePage.snakbarMessages
class TranslationsStringsStoragePageSnakbarMessagesEn {
	TranslationsStringsStoragePageSnakbarMessagesEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String removedSingle({required Object fileUrl}) => 'Was deleted: ${fileUrl}.';
	String get removedSelected => 'Selected tickets were deleted.';
	String get unexpected => 'Something went wrong.';
	String get requiredSaveFile => 'First, you need to save file.';
}

// Path: strings.storagePage.body
class TranslationsStringsStoragePageBodyEn {
	TranslationsStringsStoragePageBodyEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get noMoreItems => 'There is nothing more...';
	late final TranslationsStringsStoragePageBodyListTicketItemEn listTicketItem = TranslationsStringsStoragePageBodyListTicketItemEn._(_root);
}

// Path: strings.storagePage.fab
class TranslationsStringsStoragePageFabEn {
	TranslationsStringsStoragePageFabEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get deleteSelected => 'Delete selected';
	String get add => 'Add';
}

// Path: strings.storagePage.bottomAppBar
class TranslationsStringsStoragePageBottomAppBarEn {
	TranslationsStringsStoragePageBottomAppBarEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	late final TranslationsStringsStoragePageBottomAppBarSelectionEn selection = TranslationsStringsStoragePageBottomAppBarSelectionEn._(_root);
}

// Path: strings.storagePage.modalBottomSheet
class TranslationsStringsStoragePageModalBottomSheetEn {
	TranslationsStringsStoragePageModalBottomSheetEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get fileUrlTextField => 'PDF file url';
	String get addButton => 'Add';
}

// Path: strings.settingsPage.appbar
class TranslationsStringsSettingsPageAppbarEn {
	TranslationsStringsSettingsPageAppbarEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Settings';
}

// Path: strings.settingsPage.locales.0
class TranslationsStringsSettingsPage$locales$0i0$En {
	TranslationsStringsSettingsPage$locales$0i0$En._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Auto';
}

// Path: strings.settingsPage.locales.1
class TranslationsStringsSettingsPage$locales$0i1$En {
	TranslationsStringsSettingsPage$locales$0i1$En._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'English';
}

// Path: strings.settingsPage.locales.2
class TranslationsStringsSettingsPage$locales$0i2$En {
	TranslationsStringsSettingsPage$locales$0i2$En._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Russian';
}

// Path: errorStrings.features.ticketStorage.repositories
class TranslationsErrorStringsFeaturesTicketStorageRepositoriesEn {
	TranslationsErrorStringsFeaturesTicketStorageRepositoriesEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	late final TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryEn ticketsRepository = TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryEn._(_root);
}

// Path: errorStrings.features.ticketStorage.presentation
class TranslationsErrorStringsFeaturesTicketStoragePresentationEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocEn ticketsBloc = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocEn._(_root);
}

// Path: strings.storagePage.appbar.popupMenuButton
class TranslationsStringsStoragePageAppbarPopupMenuButtonEn {
	TranslationsStringsStoragePageAppbarPopupMenuButtonEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get settings => 'Settings';
}

// Path: strings.storagePage.body.listTicketItem
class TranslationsStringsStoragePageBodyListTicketItemEn {
	TranslationsStringsStoragePageBodyListTicketItemEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get title => 'Ticket';
	String get subtitleFileDownloaded => 'File was downloaded';
	String get subtitleFileDownloading => 'Downloading';
	String get subtitleFileDownload => 'Pending downloading';
	String get subtitleFileError => 'Downloading error';
	late final TranslationsStringsStoragePageBodyListTicketItemSlidableActionEn slidableAction = TranslationsStringsStoragePageBodyListTicketItemSlidableActionEn._(_root);
}

// Path: strings.storagePage.bottomAppBar.selection
class TranslationsStringsStoragePageBottomAppBarSelectionEn {
	TranslationsStringsStoragePageBottomAppBarSelectionEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get tooltip => 'Select group';
}

// Path: errorStrings.features.ticketStorage.repositories.ticketsRepository
class TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryEn {
	TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	late final TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryAddTicketEn addTicket = TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryAddTicketEn._(_root);
	late final TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryUpdateTicketEn updateTicket = TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryUpdateTicketEn._(_root);
	late final TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryGetSingleTicketEn getSingleTicket = TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryGetSingleTicketEn._(_root);
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetTicketsEventEn getTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetTicketsEventEn._(_root);
	late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetSingleTicketsEventEn getSingleTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetSingleTicketsEventEn._(_root);
	late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocAddTicketEventEn addTicketEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocAddTicketEventEn._(_root);
	late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocDeletedTicketEventEn deletedTicketEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocDeletedTicketEventEn._(_root);
	late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRefreshTicketsEventEn refreshTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRefreshTicketsEventEn._(_root);
	late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocSetSelectionSingleTicketsEventEn setSelectionSingleTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocSetSelectionSingleTicketsEventEn._(_root);
	late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocResetSelectionTicketsEventEn resetSelectionTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocResetSelectionTicketsEventEn._(_root);
	late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRemoveSelectedTicketsEventEn removeSelectedTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRemoveSelectedTicketsEventEn._(_root);
}

// Path: strings.storagePage.body.listTicketItem.slidableAction
class TranslationsStringsStoragePageBodyListTicketItemSlidableActionEn {
	TranslationsStringsStoragePageBodyListTicketItemSlidableActionEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get delete => 'Delete';
}

// Path: errorStrings.features.ticketStorage.repositories.ticketsRepository.addTicket
class TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryAddTicketEn {
	TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryAddTicketEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get notAdded => 'Ticket wasn\'t added.';
	String get duplicate => 'Duplicate isn\'t allowed.';
}

// Path: errorStrings.features.ticketStorage.repositories.ticketsRepository.updateTicket
class TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryUpdateTicketEn {
	TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryUpdateTicketEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get notUpdated => 'Ticket wasnt\'t updated.';
}

// Path: errorStrings.features.ticketStorage.repositories.ticketsRepository.getSingleTicket
class TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryGetSingleTicketEn {
	TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryGetSingleTicketEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get itsNull => 'Ticket wasn\'t found.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.getTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetTicketsEventEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get error => 'Tickets hasn\'t got from the local storage.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.getSingleTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetSingleTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetSingleTicketsEventEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get notFound => 'Such a ticket wasn\'t found.';
	String get error => 'A ticket hasn\'t got from the local storage.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.addTicketEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocAddTicketEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocAddTicketEventEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get error => 'Ticket wasn\'t added.';
	String get duplicate => 'Duplicate isn\'t allowed.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.deletedTicketEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocDeletedTicketEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocDeletedTicketEventEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get error => 'Ticket wasn\'t deleted.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.refreshTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRefreshTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRefreshTicketsEventEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get error => 'Can\'t loaded tickets.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.setSelectionSingleTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocSetSelectionSingleTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocSetSelectionSingleTicketsEventEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get error => 'Can\'t select a ticket.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.resetSelectionTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocResetSelectionTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocResetSelectionTicketsEventEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get error => 'Can\'t reset selection.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.removeSelectedTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRemoveSelectedTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRemoveSelectedTicketsEventEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	String get error => 'Can\'t reset selection.';
}

// Path: <root>
class TranslationsRu extends TranslationsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	@override final TranslationMetadata<AppLocale, TranslationsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	@override late final TranslationsRu _root = this; // ignore: unused_field

	// Translations
	@override late final TranslationsErrorStringsRu errorStrings = TranslationsErrorStringsRu._(_root);
	@override late final TranslationsStringsRu strings = TranslationsStringsRu._(_root);
}

// Path: errorStrings
class TranslationsErrorStringsRu extends TranslationsErrorStringsEn {
	TranslationsErrorStringsRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get unexpected => 'Что-то пошло не так...';
	@override late final TranslationsErrorStringsFeaturesRu features = TranslationsErrorStringsFeaturesRu._(_root);
}

// Path: strings
class TranslationsStringsRu extends TranslationsStringsEn {
	TranslationsStringsRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get appName => 'Tickets storage';
	@override late final TranslationsStringsStoragePageRu storagePage = TranslationsStringsStoragePageRu._(_root);
	@override late final TranslationsStringsSettingsPageRu settingsPage = TranslationsStringsSettingsPageRu._(_root);
	@override late final TranslationsStringsValidatorsRu validators = TranslationsStringsValidatorsRu._(_root);
}

// Path: errorStrings.features
class TranslationsErrorStringsFeaturesRu extends TranslationsErrorStringsFeaturesEn {
	TranslationsErrorStringsFeaturesRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsErrorStringsFeaturesTicketStorageRu ticketStorage = TranslationsErrorStringsFeaturesTicketStorageRu._(_root);
}

// Path: strings.storagePage
class TranslationsStringsStoragePageRu extends TranslationsStringsStoragePageEn {
	TranslationsStringsStoragePageRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsStringsStoragePageAppbarRu appbar = TranslationsStringsStoragePageAppbarRu._(_root);
	@override late final TranslationsStringsStoragePageSnakbarMessagesRu snakbarMessages = TranslationsStringsStoragePageSnakbarMessagesRu._(_root);
	@override late final TranslationsStringsStoragePageBodyRu body = TranslationsStringsStoragePageBodyRu._(_root);
	@override late final TranslationsStringsStoragePageFabRu fab = TranslationsStringsStoragePageFabRu._(_root);
	@override late final TranslationsStringsStoragePageBottomAppBarRu bottomAppBar = TranslationsStringsStoragePageBottomAppBarRu._(_root);
	@override late final TranslationsStringsStoragePageModalBottomSheetRu modalBottomSheet = TranslationsStringsStoragePageModalBottomSheetRu._(_root);
}

// Path: strings.settingsPage
class TranslationsStringsSettingsPageRu extends TranslationsStringsSettingsPageEn {
	TranslationsStringsSettingsPageRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsStringsSettingsPageAppbarRu appbar = TranslationsStringsSettingsPageAppbarRu._(_root);
	@override List<dynamic> get locales => [
		TranslationsStringsSettingsPage$locales$0i0$Ru._(_root),
		TranslationsStringsSettingsPage$locales$0i1$Ru._(_root),
		TranslationsStringsSettingsPage$locales$0i2$Ru._(_root),
	];
}

// Path: strings.validators
class TranslationsStringsValidatorsRu extends TranslationsStringsValidatorsEn {
	TranslationsStringsValidatorsRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String minLengthMessage({required Object minLength}) => 'Значение должно быть не менее ${minLength} символов.';
	@override String maxLengthMessage({required Object maxLength}) => 'Значение должно быть не более ${maxLength} символов.';
	@override String get emptyLengthMessage => 'Это поле должно быть заполнено.';
	@override String get linkMessage => 'Ссылка не корректна.';
	@override String get extensionMessage => 'Файлы с таким расширениемне разрешены.';
}

// Path: errorStrings.features.ticketStorage
class TranslationsErrorStringsFeaturesTicketStorageRu extends TranslationsErrorStringsFeaturesTicketStorageEn {
	TranslationsErrorStringsFeaturesTicketStorageRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsErrorStringsFeaturesTicketStorageRepositoriesRu repositories = TranslationsErrorStringsFeaturesTicketStorageRepositoriesRu._(_root);
	@override late final TranslationsErrorStringsFeaturesTicketStoragePresentationRu presentation = TranslationsErrorStringsFeaturesTicketStoragePresentationRu._(_root);
}

// Path: strings.storagePage.appbar
class TranslationsStringsStoragePageAppbarRu extends TranslationsStringsStoragePageAppbarEn {
	TranslationsStringsStoragePageAppbarRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Хранилище билетов';
	@override late final TranslationsStringsStoragePageAppbarPopupMenuButtonRu popupMenuButton = TranslationsStringsStoragePageAppbarPopupMenuButtonRu._(_root);
}

// Path: strings.storagePage.snakbarMessages
class TranslationsStringsStoragePageSnakbarMessagesRu extends TranslationsStringsStoragePageSnakbarMessagesEn {
	TranslationsStringsStoragePageSnakbarMessagesRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String removedSingle({required Object fileUrl}) => 'Удален: ${fileUrl}.';
	@override String get removedSelected => 'Выбранные билеты были удалены.';
	@override String get unexpected => 'Что-то пошло не так.';
}

// Path: strings.storagePage.body
class TranslationsStringsStoragePageBodyRu extends TranslationsStringsStoragePageBodyEn {
	TranslationsStringsStoragePageBodyRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get noMoreItems => 'Больше ничего нет...';
	@override late final TranslationsStringsStoragePageBodyListTicketItemRu listTicketItem = TranslationsStringsStoragePageBodyListTicketItemRu._(_root);
}

// Path: strings.storagePage.fab
class TranslationsStringsStoragePageFabRu extends TranslationsStringsStoragePageFabEn {
	TranslationsStringsStoragePageFabRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get deleteSelected => 'Удалить выбранные';
	@override String get add => 'Добавить';
}

// Path: strings.storagePage.bottomAppBar
class TranslationsStringsStoragePageBottomAppBarRu extends TranslationsStringsStoragePageBottomAppBarEn {
	TranslationsStringsStoragePageBottomAppBarRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsStringsStoragePageBottomAppBarSelectionRu selection = TranslationsStringsStoragePageBottomAppBarSelectionRu._(_root);
}

// Path: strings.storagePage.modalBottomSheet
class TranslationsStringsStoragePageModalBottomSheetRu extends TranslationsStringsStoragePageModalBottomSheetEn {
	TranslationsStringsStoragePageModalBottomSheetRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get fileUrlTextField => 'Ссылка на PDF файл';
	@override String get addButton => 'Добавить';
}

// Path: strings.settingsPage.appbar
class TranslationsStringsSettingsPageAppbarRu extends TranslationsStringsSettingsPageAppbarEn {
	TranslationsStringsSettingsPageAppbarRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Настройки';
}

// Path: strings.settingsPage.locales.0
class TranslationsStringsSettingsPage$locales$0i0$Ru extends TranslationsStringsSettingsPage$locales$0i0$En {
	TranslationsStringsSettingsPage$locales$0i0$Ru._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Язык устройства';
}

// Path: strings.settingsPage.locales.1
class TranslationsStringsSettingsPage$locales$0i1$Ru extends TranslationsStringsSettingsPage$locales$0i1$En {
	TranslationsStringsSettingsPage$locales$0i1$Ru._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'English';
}

// Path: strings.settingsPage.locales.2
class TranslationsStringsSettingsPage$locales$0i2$Ru extends TranslationsStringsSettingsPage$locales$0i2$En {
	TranslationsStringsSettingsPage$locales$0i2$Ru._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Русский';
}

// Path: errorStrings.features.ticketStorage.repositories
class TranslationsErrorStringsFeaturesTicketStorageRepositoriesRu extends TranslationsErrorStringsFeaturesTicketStorageRepositoriesEn {
	TranslationsErrorStringsFeaturesTicketStorageRepositoriesRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryRu ticketsRepository = TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryRu._(_root);
}

// Path: errorStrings.features.ticketStorage.presentation
class TranslationsErrorStringsFeaturesTicketStoragePresentationRu extends TranslationsErrorStringsFeaturesTicketStoragePresentationEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRu ticketsBloc = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRu._(_root);
}

// Path: strings.storagePage.appbar.popupMenuButton
class TranslationsStringsStoragePageAppbarPopupMenuButtonRu extends TranslationsStringsStoragePageAppbarPopupMenuButtonEn {
	TranslationsStringsStoragePageAppbarPopupMenuButtonRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Настройки';
}

// Path: strings.storagePage.body.listTicketItem
class TranslationsStringsStoragePageBodyListTicketItemRu extends TranslationsStringsStoragePageBodyListTicketItemEn {
	TranslationsStringsStoragePageBodyListTicketItemRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get title => 'Билет';
	@override String get subtitleFileDownloaded => 'Файл загружен';
	@override String get subtitleFileDownloading => 'Загрузка';
	@override String get subtitleFileDownload => 'Ожидание загрузки';
	@override String get subtitleFileError => 'Ошибка при загрузке';
	@override late final TranslationsStringsStoragePageBodyListTicketItemSlidableActionRu slidableAction = TranslationsStringsStoragePageBodyListTicketItemSlidableActionRu._(_root);
}

// Path: strings.storagePage.bottomAppBar.selection
class TranslationsStringsStoragePageBottomAppBarSelectionRu extends TranslationsStringsStoragePageBottomAppBarSelectionEn {
	TranslationsStringsStoragePageBottomAppBarSelectionRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get tooltip => 'Выбрать несколько';
}

// Path: errorStrings.features.ticketStorage.repositories.ticketsRepository
class TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryRu extends TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryEn {
	TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryAddTicketRu addTicket = TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryAddTicketRu._(_root);
	@override late final TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryUpdateTicketRu updateTicket = TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryUpdateTicketRu._(_root);
	@override late final TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryGetSingleTicketRu getSingleTicket = TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryGetSingleTicketRu._(_root);
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRu extends TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetTicketsEventRu getTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetTicketsEventRu._(_root);
	@override late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetSingleTicketsEventRu getSingleTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetSingleTicketsEventRu._(_root);
	@override late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocAddTicketEventRu addTicketEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocAddTicketEventRu._(_root);
	@override late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocDeletedTicketEventRu deletedTicketEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocDeletedTicketEventRu._(_root);
	@override late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRefreshTicketsEventRu refreshTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRefreshTicketsEventRu._(_root);
	@override late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocSetSelectionSingleTicketsEventRu setSelectionSingleTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocSetSelectionSingleTicketsEventRu._(_root);
	@override late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocResetSelectionTicketsEventRu resetSelectionTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocResetSelectionTicketsEventRu._(_root);
	@override late final TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRemoveSelectedTicketsEventRu removeSelectedTicketsEvent = TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRemoveSelectedTicketsEventRu._(_root);
}

// Path: strings.storagePage.body.listTicketItem.slidableAction
class TranslationsStringsStoragePageBodyListTicketItemSlidableActionRu extends TranslationsStringsStoragePageBodyListTicketItemSlidableActionEn {
	TranslationsStringsStoragePageBodyListTicketItemSlidableActionRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get delete => 'Удалить';
}

// Path: errorStrings.features.ticketStorage.repositories.ticketsRepository.addTicket
class TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryAddTicketRu extends TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryAddTicketEn {
	TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryAddTicketRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get notAdded => 'Билет не был добавлен.';
	@override String get duplicate => 'Дублирование запрещено.';
}

// Path: errorStrings.features.ticketStorage.repositories.ticketsRepository.updateTicket
class TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryUpdateTicketRu extends TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryUpdateTicketEn {
	TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryUpdateTicketRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get notUpdated => 'Билет не был обновлен.';
}

// Path: errorStrings.features.ticketStorage.repositories.ticketsRepository.getSingleTicket
class TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryGetSingleTicketRu extends TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryGetSingleTicketEn {
	TranslationsErrorStringsFeaturesTicketStorageRepositoriesTicketsRepositoryGetSingleTicketRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get itsNull => 'Билет не найден.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.getTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetTicketsEventRu extends TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetTicketsEventRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get error => 'Билеты не попали из локального хранилища.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.getSingleTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetSingleTicketsEventRu extends TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetSingleTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocGetSingleTicketsEventRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get notFound => 'Такой билет не найден.';
	@override String get error => 'Билет не попал из локального хранилища.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.addTicketEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocAddTicketEventRu extends TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocAddTicketEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocAddTicketEventRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get error => 'Билет не добавлен.';
	@override String get duplicate => 'Дублирование запрещено.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.deletedTicketEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocDeletedTicketEventRu extends TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocDeletedTicketEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocDeletedTicketEventRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get error => 'Билет не удален.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.refreshTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRefreshTicketsEventRu extends TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRefreshTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRefreshTicketsEventRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get error => 'Невозможно загрузить билеты.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.setSelectionSingleTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocSetSelectionSingleTicketsEventRu extends TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocSetSelectionSingleTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocSetSelectionSingleTicketsEventRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get error => 'Невозможно выбрать билет.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.resetSelectionTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocResetSelectionTicketsEventRu extends TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocResetSelectionTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocResetSelectionTicketsEventRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get error => 'Невозможно сбросить выбор.';
}

// Path: errorStrings.features.ticketStorage.presentation.ticketsBloc.removeSelectedTicketsEvent
class TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRemoveSelectedTicketsEventRu extends TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRemoveSelectedTicketsEventEn {
	TranslationsErrorStringsFeaturesTicketStoragePresentationTicketsBlocRemoveSelectedTicketsEventRu._(TranslationsRu root) : this._root = root, super._(root);

	@override final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get error => 'Невозможно удалить выбранные билеты.';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'errorStrings.unexpected': return 'Something went wron...';
			case 'errorStrings.features.ticketStorage.repositories.ticketsRepository.addTicket.notAdded': return 'Ticket wasn\'t added.';
			case 'errorStrings.features.ticketStorage.repositories.ticketsRepository.addTicket.duplicate': return 'Duplicate isn\'t allowed.';
			case 'errorStrings.features.ticketStorage.repositories.ticketsRepository.updateTicket.notUpdated': return 'Ticket wasnt\'t updated.';
			case 'errorStrings.features.ticketStorage.repositories.ticketsRepository.getSingleTicket.itsNull': return 'Ticket wasn\'t found.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.getTicketsEvent.error': return 'Tickets hasn\'t got from the local storage.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.getSingleTicketsEvent.notFound': return 'Such a ticket wasn\'t found.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.getSingleTicketsEvent.error': return 'A ticket hasn\'t got from the local storage.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.addTicketEvent.error': return 'Ticket wasn\'t added.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.addTicketEvent.duplicate': return 'Duplicate isn\'t allowed.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.deletedTicketEvent.error': return 'Ticket wasn\'t deleted.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.refreshTicketsEvent.error': return 'Can\'t loaded tickets.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.setSelectionSingleTicketsEvent.error': return 'Can\'t select a ticket.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.resetSelectionTicketsEvent.error': return 'Can\'t reset selection.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.removeSelectedTicketsEvent.error': return 'Can\'t reset selection.';
			case 'strings.appName': return 'Tickets storage';
			case 'strings.storagePage.appbar.title': return 'Tickets storage';
			case 'strings.storagePage.appbar.popupMenuButton.settings': return 'Settings';
			case 'strings.storagePage.snakbarMessages.removedSingle': return ({required Object fileUrl}) => 'Was deleted: ${fileUrl}.';
			case 'strings.storagePage.snakbarMessages.removedSelected': return 'Selected tickets were deleted.';
			case 'strings.storagePage.snakbarMessages.unexpected': return 'Something went wrong.';
			case 'strings.storagePage.snakbarMessages.requiredSaveFile': return 'First, you need to save file.';
			case 'strings.storagePage.body.noMoreItems': return 'There is nothing more...';
			case 'strings.storagePage.body.listTicketItem.title': return 'Ticket';
			case 'strings.storagePage.body.listTicketItem.subtitleFileDownloaded': return 'File was downloaded';
			case 'strings.storagePage.body.listTicketItem.subtitleFileDownloading': return 'Downloading';
			case 'strings.storagePage.body.listTicketItem.subtitleFileDownload': return 'Pending downloading';
			case 'strings.storagePage.body.listTicketItem.subtitleFileError': return 'Downloading error';
			case 'strings.storagePage.body.listTicketItem.slidableAction.delete': return 'Delete';
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

extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'errorStrings.unexpected': return 'Что-то пошло не так...';
			case 'errorStrings.features.ticketStorage.repositories.ticketsRepository.addTicket.notAdded': return 'Билет не был добавлен.';
			case 'errorStrings.features.ticketStorage.repositories.ticketsRepository.addTicket.duplicate': return 'Дублирование запрещено.';
			case 'errorStrings.features.ticketStorage.repositories.ticketsRepository.updateTicket.notUpdated': return 'Билет не был обновлен.';
			case 'errorStrings.features.ticketStorage.repositories.ticketsRepository.getSingleTicket.itsNull': return 'Билет не найден.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.getTicketsEvent.error': return 'Билеты не попали из локального хранилища.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.getSingleTicketsEvent.notFound': return 'Такой билет не найден.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.getSingleTicketsEvent.error': return 'Билет не попал из локального хранилища.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.addTicketEvent.error': return 'Билет не добавлен.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.addTicketEvent.duplicate': return 'Дублирование запрещено.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.deletedTicketEvent.error': return 'Билет не удален.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.refreshTicketsEvent.error': return 'Невозможно загрузить билеты.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.setSelectionSingleTicketsEvent.error': return 'Невозможно выбрать билет.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.resetSelectionTicketsEvent.error': return 'Невозможно сбросить выбор.';
			case 'errorStrings.features.ticketStorage.presentation.ticketsBloc.removeSelectedTicketsEvent.error': return 'Невозможно удалить выбранные билеты.';
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
			case 'strings.storagePage.body.listTicketItem.slidableAction.delete': return 'Удалить';
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
			case 'strings.validators.extensionMessage': return 'Файлы с таким расширениемне разрешены.';
			default: return null;
		}
	}
}
