import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AllThemes selectedTheme = AllThemes.dark;
  Locale selectedLocal = Locale("en");
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: selectedLocal == Locale("en") ? Locale("en") : Locale("fa"),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme:
          selectedTheme == AllThemes.dark
              ? ThemeConfig.dark().theme()
              : ThemeConfig.light().theme(),
      home: MyHomePage(
        ontap: () {
          setState(() {
            if (selectedTheme == AllThemes.dark) {
              selectedTheme = AllThemes.light;
            } else {
              selectedTheme = AllThemes.dark;
            }
          });
        },
        ontapLocal: () {
          setState(() {
            if (selectedLocal == Locale("en")) {
              selectedLocal = Locale("fa");
            } else {
              selectedLocal = Locale("en");
            }
          });
        },
      ),
    );
  }
}

enum AllThemes { dark, light }

class MyHomePage extends StatefulWidget {
  final Function() ontap;
  final Function() ontapLocal;
  const MyHomePage({super.key, required this.ontap, required this.ontapLocal});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Set<AllSkills> selectedSkills = {};

  @override
  Widget build(BuildContext context) {
    final Localizations = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(Localizations.profileTitle),
        actions: [
          InkWell(
            onTap: widget.ontapLocal,
            child: Icon(CupertinoIcons.bubble_left),
          ),
          SizedBox(width: 6),
          InkWell(
            onTap: widget.ontap,
            child: Icon(CupertinoIcons.ellipsis_vertical),
          ),
          SizedBox(width: 4),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 20, 32, 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      "assets/images/profile_image.png",
                      width: 70,
                      height: 70,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Localizations.name,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w900),
                        ),
                        Text(Localizations.job),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              CupertinoIcons.placemark,
                              size: 14,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            Text(
                              Localizations.location,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    CupertinoIcons.heart,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 20),
              child: Text(
                Localizations.summary,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    Localizations.skillSection,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    CupertinoIcons.chevron_down,
                    size: 10,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                Skill(
                  imagePath: "assets/images/app_icon_01.png",
                  isActive: selectedSkills.contains(AllSkills.photoShop),
                  shadowColor: Color.fromARGB(255, 42, 149, 255),
                  title: "Photo shop",
                  tapped: () {
                    setState(() {
                      if (selectedSkills.contains(AllSkills.photoShop)) {
                        selectedSkills.remove(AllSkills.photoShop);
                      } else {
                        selectedSkills.add(AllSkills.photoShop);
                      }
                    });
                  },
                ),
                Skill(
                  imagePath: "assets/images/app_icon_05.png",
                  isActive: selectedSkills.contains(AllSkills.xd),
                  shadowColor: Color.fromARGB(255, 252, 60, 244),
                  title: "Adobe Xd",
                  tapped: () {
                    setState(() {
                      if (selectedSkills.contains(AllSkills.xd)) {
                        selectedSkills.remove(AllSkills.xd);
                      } else {
                        selectedSkills.add(AllSkills.xd);
                      }
                    });
                  },
                ),
                Skill(
                  imagePath: "assets/images/app_icon_04.png",
                  isActive: selectedSkills.contains(AllSkills.illustrator),
                  shadowColor: Color.fromARGB(255, 252, 135, 8),
                  title: "illustrator",
                  tapped: () {
                    setState(() {
                      if (selectedSkills.contains(AllSkills.illustrator)) {
                        selectedSkills.remove(AllSkills.illustrator);
                      } else {
                        selectedSkills.add(AllSkills.illustrator);
                      }
                    });
                  },
                ),
                Skill(
                  imagePath: "assets/images/app_icon_03.png",
                  isActive: selectedSkills.contains(AllSkills.afterEffect),
                  shadowColor: Color.fromARGB(255, 134, 129, 255),
                  title: "After Effect",
                  tapped: () {
                    setState(() {
                      if (selectedSkills.contains(AllSkills.afterEffect)) {
                        selectedSkills.remove(AllSkills.afterEffect);
                      } else {
                        selectedSkills.add(AllSkills.afterEffect);
                      }
                    });
                  },
                ),
                Skill(
                  imagePath: "assets/images/app_icon_02.png",
                  isActive: selectedSkills.contains(AllSkills.lightRoom),
                  shadowColor: Color.fromARGB(255, 42, 149, 255),
                  title: "LightRoom",
                  tapped: () {
                    setState(() {
                      if (selectedSkills.contains(AllSkills.lightRoom)) {
                        selectedSkills.remove(AllSkills.lightRoom);
                      } else {
                        selectedSkills.add(AllSkills.lightRoom);
                      }
                    });
                  },
                ),
              ],
            ),
            SizedBox(height: 6),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
              child: Row(
                children: [
                  Text(
                    Localizations.personalInformationSection,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 4, 32, 4),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.at),
                      label: Text(Localizations.email),
                    ),
                  ),
                  SizedBox(height: 6),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(CupertinoIcons.lock),
                      label: Text(Localizations.password),
                    ),
                  ),
                  SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                    child: SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(Localizations.buttonText),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ThemeConfig {
  final Color appBarBackgroundColor;
  final Color backGroundColor;
  final Color textColor;
  final Color textFieldFillColor;
  final Color iconColor;

  ThemeConfig.dark()
    : appBarBackgroundColor = Colors.black,
      backGroundColor = Color.fromARGB(255, 30, 30, 30),
      textColor = Colors.white,
      textFieldFillColor = Color.fromARGB(255, 40, 40, 40),
      iconColor = Color.fromARGB(255, 175, 175, 175);

  ThemeConfig.light()
    : appBarBackgroundColor = Color.fromARGB(255, 150, 150, 150),
      backGroundColor = Color.fromARGB(255, 220, 220, 220),
      textColor = Colors.black,
      textFieldFillColor = Color.fromARGB(255, 150, 150, 150),
      iconColor = Colors.black;

  ThemeData theme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Color.fromARGB(255, 138, 35, 63),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackgroundColor,
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: iconColor),
      ),
      dividerTheme: DividerThemeData(color: Color.fromARGB(40, 200, 200, 200)),
      scaffoldBackgroundColor: backGroundColor,
      iconTheme: IconThemeData(color: iconColor),
      textTheme: TextTheme(
        bodyMedium: TextStyle(fontSize: 14, color: textColor),
        bodySmall: TextStyle(fontSize: 12, color: textColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderSide: BorderSide.none),
        filled: true,
        fillColor: textFieldFillColor,
        labelStyle: TextStyle(color: Color.fromARGB(150, 255, 255, 255)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 248, 41, 102),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}

class Skill extends StatelessWidget {
  final String imagePath;
  final String title;
  final Color shadowColor;
  final bool isActive;
  final Function() tapped;

  const Skill({
    super.key,
    required this.imagePath,
    required this.title,
    required this.shadowColor,
    required this.isActive,
    required this.tapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: tapped,
      child: Container(
        width: 110,
        height: 110,
        decoration:
            isActive
                ? BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color.fromARGB(30, 200, 200, 200),
                )
                : null,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 22, 0, 12),
          child: Column(
            children: [
              Container(
                decoration:
                    isActive
                        ? BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: shadowColor,
                              spreadRadius: 2,
                              blurRadius: 20,
                            ),
                          ],
                        )
                        : null,
                child: Image.asset(imagePath, width: 45, height: 45),
              ),
              SizedBox(height: 6),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}

enum AllSkills { photoShop, xd, illustrator, afterEffect, lightRoom }
