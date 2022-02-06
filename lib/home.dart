import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_int/models/language_model.dart';
import 'package:flutter_int/utils/size_config.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    const locales = AppLocalizations.supportedLocales;

    return Material(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(40), vertical: getProportionateScreenHeight(80)),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
              )
            ],
            borderRadius: BorderRadius.circular(30)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(AppLocalizations.of(context)!.title),
            ...locales.map<Widget>((l) {
              return Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder()
                  ),
                  child: Text(l.languageCode),
                  onPressed: () {
                    Provider.of<LanguageModel>(context, listen: false).setLocale(l);
                  },
                ),
              );
            }).toList()
          ]
        ),
      ),
    );
  }
}
