

import 'package:apidemo/Screen/Provider/HomeProvider.dart';
import 'package:apidemo/Screen/View/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        routes: 
        {
          '/':(context) => HomeSCreen()
        },
      ),
    )
  );
}