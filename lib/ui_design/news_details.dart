import 'package:flutter/material.dart';
import 'package:news_app/model/NewsModel.dart';
import 'package:url_launcher/url_launcher.dart';
class News_details extends StatefulWidget {

  final NewsModel newsModel;
  const News_details({super.key, required this.newsModel});

  @override
  State<News_details> createState() => _News_detailsState();
}

class _News_detailsState extends State<News_details> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text(widget.newsModel.title.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
        backgroundColor: Colors.cyanAccent,
        centerTitle: true,
        toolbarHeight: 60,
      ),
body: Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Column(

    mainAxisAlignment: MainAxisAlignment.start,

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      //Text(newsModel.title.toString()),

      widget.newsModel.urlToImage == null

          ? Center(child: Icon(Icons.error))

          : Image.network(

        widget.newsModel.urlToImage.toString(),

        height: 250,

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

              widget.newsModel.source.toString(),

              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),

            ),

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(25),

              color: Colors.red,

            ),

          ),



          SizedBox(

            width: 8,

          ),

          Text(

            widget.newsModel.publishedAt.toString(),

            style: TextStyle(fontWeight: FontWeight.w600),

          )

        ],

      ),

      SizedBox(

        height: 8,

      ),

      Text( widget.newsModel.author == null

          ? ""

          : "Written by: ${ widget.newsModel.author.toString()}",  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),

      SizedBox(

        height: 3,

      ),

      Text( widget.newsModel.title.toString()),

      SizedBox(

        height: 5,

      ),

       Text(widget.newsModel.description.toString()),
      Center(
        child: ElevatedButton(onPressed: ()async{

          final Uri uri=Uri.parse(widget.newsModel.url.toString());

          if(await launchUrl(uri)){
            throw Exception("launched failed");
          }
        },

            style:ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.red) ),
            child: Text("Read more....",style: TextStyle(color: Colors.black,fontSize: 23),)),
      )



    ],

  ),
),

    ));
  }
}
