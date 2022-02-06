import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LanguageModel extends ChangeNotifier {

  late Locale _locale = AppLocalizations.supportedLocales.last;

  Locale get locale => _locale;



  void setLocale(Locale l) {
    _locale = l;
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

}