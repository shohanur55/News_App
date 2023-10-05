import 'package:flutter/material.dart';

import '../model/NewsModel.dart';
import '../services/api_services.dart';
import 'news_item_list.dart';
class Breaking_news extends StatefulWidget {
  const Breaking_news({super.key});

  @override
  State<Breaking_news> createState() => _Breaking_newsState();
}

class _Breaking_newsState extends State<Breaking_news> {
  Api_services api_services = Api_services();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: api_services.getBreakingNews(),
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
