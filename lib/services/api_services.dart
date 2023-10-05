import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:news_app/model/NewsModel.dart';
import 'package:http/http.dart' as http;

class Api_services {
  Future<List<NewsModel>> getAllNews() async {
    try {
      final response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?q=bitcoin&apiKey=def1681f402e4b06b29e6ff0272fc13f"));
      if (response.statusCode == 200) {
         Map<String, dynamic> json = jsonDecode(response.body);
       List<dynamic> body = json['articles'];
       List<NewsModel> articlelist =
            body.map((item) => NewsModel.fromJson(item)).toList();
        return articlelist;
      } else {
        throw ("No item found");
      }
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<List<NewsModel>> getBreakingNews() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines?country=us&apiKey=def1681f402e4b06b29e6ff0272fc13f"));
      if (response.statusCode == 200) {
         Map<String, dynamic> json = jsonDecode(response.body);
         List<dynamic> body = json['articles'];
         List<NewsModel> articlelist =
            body.map((item) => NewsModel.fromJson(item)).toList();

             return articlelist;
      } else {
      throw Exception ("No item found");
      }
    } catch(e) {
      print(e.toString());
      throw e;
    }

  }
}
