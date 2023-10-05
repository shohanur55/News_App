import 'package:flutter/material.dart';
import 'package:news_app/model/NewsModel.dart';
import 'package:news_app/services/api_services.dart';
import 'package:news_app/ui_design/news_item_list.dart';
class All_news extends StatefulWidget {
  const All_news({super.key});

  @override
  State<All_news> createState() => _All_newsState();
}

class _All_newsState extends State<All_news> {
  @override
 Api_services api_services=Api_services();
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: api_services.getAllNews(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<NewsModel> articlelist = snapshot.data ?? [];
              return ListView.builder(

                itemBuilder: (context, index) {
                  return News_item_list(newsModel: articlelist[index]);
                },
                itemCount: articlelist.length,
              );

            }
            return const Center(child: CircularProgressIndicator());
          }
      ),
    );
  }

}
