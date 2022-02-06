import 'package:flutter/material.dart';
import 'package:flutter_int/pages/review_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const FlutterInt1());
}
class FlutterInt1 extends StatelessWidget {
  const FlutterInt1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterInt1',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: (
          Locale? locale,
          Iterable<Locale> supportedLocales,
          ) {
        return locale;
      },
      home: const ReviewPage(),
    );
  }
}

class HomePage1 extends StatelessWidget {
  const HomePage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text(AppLocalizations.of(context)!.description),
      ),
    );
  }
}


