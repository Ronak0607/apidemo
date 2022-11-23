import 'package:apidemo/Screen/Model/NewsModel.dart';
import 'package:apidemo/Screen/Provider/HomeProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeSCreen extends StatefulWidget {
  const HomeSCreen({Key? key}) : super(key: key);

  @override
  State<HomeSCreen> createState() => _HomeSCreenState();
}

class _HomeSCreenState extends State<HomeSCreen> {
  HomeProvider? homeProvidertrue;
  HomeProvider? homeProviderfalse;

  @override
  Widget build(BuildContext context) {
    homeProvidertrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderfalse = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(child: Scaffold(body: FutureBuilder<NewsModel>(
        future: homeProviderfalse!.ApiCalling(),
        builder: (context, snapshot) {
          if(snapshot.hasError)
          {
            Text("${snapshot.error}");

          }
          else if(snapshot.hasData)
          {
            NewsModel newsModel = snapshot.data!;
            return ListView.builder(itemCount: newsModel.articles!.length,itemBuilder: (context,index){
              return ListTile(
                title: Text("${newsModel.articles![index].title}"),
              );
            });



          }
          return Center(child: CircularProgressIndicator());
        }))
    );


  }
}
