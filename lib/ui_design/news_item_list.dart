
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsModel.dart';
import 'package:news_app/ui_design/news_details.dart';
import 'package:path_provider/path_provider.dart';

class News_item_list extends StatelessWidget {
  final NewsModel newsModel;

  const News_item_list({Key? key, required this.newsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
   onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => News_details(newsModel:newsModel),)),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.symmetric(horizontal: 12),

            // fit:BoxFit.fitHeight,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Text(newsModel.title.toString()),
                newsModel.urlToImage == null
                    ? Center(child: Icon(Icons.error))
                    : Image.network(
                        newsModel.urlToImage.toString(),
                        height:250,
                        width: double.infinity,
                        fit: BoxFit.fitWidth,
                      ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          newsModel.source.toString(),
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.red,
                        ),
                      ),

                    SizedBox(

                    ),
                    Text(
                      newsModel.publishedAt.toString(),
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Text(newsModel.author == null
                    ? ""
                    : "Written by: ${newsModel.author.toString()}",  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
                SizedBox(
                  height: 3,
                ),
                Text(newsModel.title.toString()),


              ],
            ),
      ),
    );
  }
}
