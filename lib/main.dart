import 'package:flutter/material.dart';
import 'package:flutter_int/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_int/models/language_model.dart';
import 'package:flutter_int/pages/review_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguageModel(),
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageModel>(
      builder: (context, lm, child) {
        return MaterialApp(
          title: 'Flutter internationalization App',
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          home: const ReviewPage(),
          locale: lm.locale,
          localeResolutionCallback: (
            Locale? locale,
            Iterable<Locale> supportedLocales,
          ) {
            return locale;
          },
        );
      }
    );
  }
}
