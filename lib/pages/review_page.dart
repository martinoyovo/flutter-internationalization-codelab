import 'package:flutter/material.dart';
import 'package:flutter_int/models/language_model.dart';
import 'package:flutter_int/utils/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_int/utils/styles.dart';
import 'package:provider/provider.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const locales = AppLocalizations.supportedLocales;

    SizeConfig.init(context);
    return Material(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(40),
            vertical: getProportionateScreenHeight(80)),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
              )
            ],
            borderRadius: BorderRadius.circular(30)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/burger.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  margin: const EdgeInsets.only(
                      left: 50, top: 40, bottom: 40, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: locales.map<Widget>((l) {
                            return Center(
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: InkWell(
                                  child: Text(l.languageCode.toUpperCase(), style: TextStyle(decoration: l == Provider.of<LanguageModel>(context, listen: false).locale ? TextDecoration.underline : TextDecoration.none),),
                                  onTap: () {
                                    Provider.of<LanguageModel>(context,
                                            listen: false)
                                        .setLocale(l);
                                  },
                                ),
                              ),
                            );
                          }).toList()),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        AppLocalizations.of(context)!.title,
                        style: const TextStyle(
                            fontSize: 33, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        AppLocalizations.of(context)!.description,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          ElevatedButton(
                            child: Text(AppLocalizations.of(context)!.acceptText),
                            style: ElevatedButton.styleFrom(
                                primary: Styles.primaryColor,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 20,
                                ),
                                shape: const StadiumBorder()),
                            onPressed: () {},
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          OutlinedButton(
                            child: Text(
                              AppLocalizations.of(context)!.cancelText,
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 20,
                                ),
                                shape: const StadiumBorder()),
                            onPressed: () {},
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
