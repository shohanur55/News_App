import 'package:flutter/material.dart';
import 'package:news_app/ui_design/all_news.dart';
import 'package:path_provider/path_provider.dart';
import 'breaking_news.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "News APP",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
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
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                title: Text("News App",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),),
                backgroundColor: Colors.cyanAccent,
                centerTitle: true,
                toolbarHeight: 70,

                bottom: TabBar(
                  tabs: [
                    Tab(child: Text("Breaking news")),
                    Tab(
                      child: Text("ALL News"),
                    )
                  ],
                )),
            body: TabBarView(
              children: [

                Breaking_news(),
                All_news(),
              ],
            ),
          ),
        ));
  }
}
