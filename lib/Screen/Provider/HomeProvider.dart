import 'dart:convert';

import 'package:apidemo/Screen/Model/NewsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomeProvider extends ChangeNotifier
{

  String ApiLink = "https://newsapi.org/v2/everything?q=tesla&from=2022-10-23&sortBy=publishedAt&apiKey=d230b961382c473f9f014486aabbcd71";

  // Future<NewsModel> apiCalling()
  // async {
  //   var jsonString = await http.get(Uri.parse(ApiLink));
  //   var json=jsonDecode(jsonString.body);
  //
  //   return NewsModel.fromJson(json);
  // }

Future<NewsModel> ApiCalling()
async {
  var jsonString =await http.get(Uri.parse(ApiLink));
  var json= jsonDecode(jsonString.body);

  return NewsModel.fromJson(json);
}

}