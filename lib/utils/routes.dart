import 'package:api_crud_practice/controllers/data_controller.dart';
import 'package:api_crud_practice/views/addProductScreen/add_product_screen.dart';
import 'package:api_crud_practice/views/homeScreen/home_screen.dart';
import 'package:api_crud_practice/views/updateProductScreen/update_product_screen.dart';
import 'package:flutter/material.dart';

import '../controllers/data_repository.dart';

class Routes{
  static const homeScreen = "/homeScreen";
  static const addProductScreen = "/addProductScreen";
  static const updateProductScreen = "/updateProductScreen";

  static MaterialPageRoute? generateRoute(RouteSettings routeSettings){
    final Map<String,WidgetBuilder> routes = {
      Routes.homeScreen:(context) => const HomeScreen(),
      Routes.addProductScreen:(context){
        DataRepository dataController = routeSettings.arguments as DataRepository;
        return AddProductScreen(dataController: dataController);
      },
      Routes.updateProductScreen : (context){
        Map<String,dynamic> routeData = routeSettings.arguments as Map<String,dynamic>;
        return UpdateProductScreen(dataController: routeData["dataRepository"], product: routeData["product"]);
      }
    };
    final WidgetBuilder? builder = routes[routeSettings.name];
    return (builder !=null) ? MaterialPageRoute(builder: builder) : null;
  }

}