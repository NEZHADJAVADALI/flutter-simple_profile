import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 138, 35, 63),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 175, 175, 175)),
        ),
        dividerTheme: DividerThemeData(
          color: Color.fromARGB(40, 200, 200, 200),
        ),
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        iconTheme: IconThemeData(color: Color.fromARGB(200, 255, 255, 255)),
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 14, color: Colors.white),
          bodySmall: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Set<AllSkills> selectedSkills = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Profile"),
        actions: [
          Icon(CupertinoIcons.bubble_left),
          SizedBox(width: 6),
          Icon(CupertinoIcons.ellipsis_vertical),
          SizedBox(width: 4),
        ],
      ),
      body: Column(
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
                        'Brice Séraphin',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text("Product & Print Designer"),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(CupertinoIcons.placemark, size: 14),
                          Text(
                            "Paris, France",
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
              "Enthusiastic young computer Geek, Freelance Designer in love of Independence, I have a lot of experience in graphical projects, and always give the best of myself to bring you to success.",
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
                  "Skills",
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 4),
                Icon(CupertinoIcons.chevron_down, size: 10),
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
                tapped: (){
                    setState(() {
                      if (selectedSkills.contains(AllSkills.photoShop)){
                        selectedSkills.remove(AllSkills.photoShop);
                      }else{
                        selectedSkills.add(AllSkills.photoShop);}
                    });
                },
              ),
              Skill(
                imagePath: "assets/images/app_icon_05.png",
                isActive: selectedSkills.contains(AllSkills.xd),
                shadowColor: Color.fromARGB(255, 252, 60, 244),
                title: "Adobe Xd",
                tapped: (){
                  setState(() {
                    if (selectedSkills.contains(AllSkills.xd)){
                      selectedSkills.remove(AllSkills.xd);
                    }else{
                      selectedSkills.add(AllSkills.xd);}
                  });
                },
              ),
              Skill(
                imagePath: "assets/images/app_icon_04.png",
                isActive: selectedSkills.contains(AllSkills.illustrator),
                shadowColor: Color.fromARGB(255, 252, 135, 8),
                title: "illustrator",
                tapped: (){
                  setState(() {
                    if (selectedSkills.contains(AllSkills.illustrator)){
                      selectedSkills.remove(AllSkills.illustrator);
                    }else{
                      selectedSkills.add(AllSkills.illustrator);}
                  });
                },
              ),
              Skill(
                imagePath: "assets/images/app_icon_03.png",
                isActive: selectedSkills.contains(AllSkills.afterEffect),
                shadowColor: Color.fromARGB(255, 134, 129, 255),
                title: "After Effect",
                tapped: (){
                  setState(() {
                    if (selectedSkills.contains(AllSkills.afterEffect)){
                      selectedSkills.remove(AllSkills.afterEffect);
                    }else{
                      selectedSkills.add(AllSkills.afterEffect);}
                  });
                },
              ),
              Skill(
                imagePath: "assets/images/app_icon_02.png",
                isActive: selectedSkills.contains(AllSkills.lightRoom),
                shadowColor: Color.fromARGB(255, 42, 149, 255),
                title: "LightRoom",
                tapped: (){
                  setState(() {
                    if (selectedSkills.contains(AllSkills.lightRoom)){
                      selectedSkills.remove(AllSkills.lightRoom);
                    }else{
                      selectedSkills.add(AllSkills.lightRoom);}
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 6),
          Divider()
        ],
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
    required this.isActive, required this.tapped,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: tapped,
      child: Container(
        width: 110,
        height: 110,
        decoration: isActive?BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(30, 200, 200, 200),
        ):null,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 22, 0, 12),
          child: Column(
            children: [
              Container(
                decoration: isActive?BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: shadowColor,
                      spreadRadius: 2,
                      blurRadius: 20,
                    ),
                  ],
                ):null,
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

enum AllSkills{
  photoShop,xd,illustrator,afterEffect,lightRoom
}
