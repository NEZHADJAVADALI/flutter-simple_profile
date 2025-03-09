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
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 138, 35, 63)),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(color: Color.fromARGB(255, 175, 175, 175)),
        ),
        dividerTheme: DividerThemeData(color: Color.fromARGB(40, 200, 200, 200)),
        scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
        iconTheme: IconThemeData(color: Color.fromARGB(200, 255, 255, 255)),
        textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 14,color: Colors.white),
        bodySmall: TextStyle(fontSize: 12,color: Colors.white)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
                SizedBox(width: 12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Brice Séraphin',style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w900 ),),
                      Text("Product & Print Designer"),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(CupertinoIcons.placemark, size:14,),
                          Text("Paris, France",style: Theme.of(context).textTheme.bodySmall,),
                        ],
                      ),
            
                    ],
                  ),
                ),
                Icon(CupertinoIcons.heart,color: Theme.of(context).primaryColor,)
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 0, 32, 20),
            child: Text("Enthuslastic young computer Geek, Freelance Designer in love of Independence, I have alot of experience in graphical projects, and always give the best of myself to bring you to success.",style: Theme.of(context).textTheme.bodyMedium,),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 4,32, 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("Skills",style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),),SizedBox(width: 4,),Icon(CupertinoIcons.chevron_down,size: 10,)],),
          )
        ],
      ),
    );
  }
}
