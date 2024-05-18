import 'package:api_crud_practice/views/homeScreen/home_screen.dart';
import 'package:flutter/material.dart';

class Routes{
  static const homeScreen = "/homeScreen";

  static MaterialPageRoute? generateRoute(RouteSettings routeSettings){
    final Map<String,WidgetBuilder> routes = {
      Routes.homeScreen:(context) => const HomeScreen(),
    };
    final WidgetBuilder? builder = routes[routeSettings.name];
    return (builder !=null) ? MaterialPageRoute(builder: builder) : null;
  }

}