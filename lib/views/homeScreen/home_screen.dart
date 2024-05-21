import 'dart:math';

import 'package:api_crud_practice/controllers/data_controller.dart';
import 'package:api_crud_practice/controllers/data_repository.dart';
import 'package:api_crud_practice/models/product_model.dart';
import 'package:api_crud_practice/services/api_service.dart';
import 'package:api_crud_practice/utils/colors.dart';
import 'package:api_crud_practice/utils/routes.dart';
import 'package:api_crud_practice/views/homeScreen/no_product_data.dart';
import 'package:api_crud_practice/views/homeScreen/product_list_layout.dart';
import 'package:api_crud_practice/views/widgets/app_alert_dialog.dart';
import 'package:api_crud_practice/views/widgets/app_snackbar.dart';
import 'package:api_crud_practice/views/widgets/app_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:toastification/toastification.dart';
import '../../utils/text_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final DataRepository dataController;
  ValueNotifier<List<ProductModel>> productListNotifier =
      ValueNotifier<List<ProductModel>>([]);

  @override
  void initState() {
    dataController = DataController(ApiService(baseUrl: baseUrl));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(homeScreenAppbarTitle),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                size: 30,
              )),
        ],
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: dataController.getProductData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        productListNotifier.value = snapshot.data!;
                        return Visibility(
                          visible: snapshot.data!.isNotEmpty,
                          replacement: NoProductData(onRefresh: () async{
                            List<ProductModel> productList =
                                await dataController.getProductData();
                            if (productList.isNotEmpty) {
                              setState(() {});
                            }
                          }),
                          child: ValueListenableBuilder<List<ProductModel>>(
                            valueListenable: productListNotifier,
                            builder: (
                              BuildContext context,
                              List<ProductModel> productList,
                              Widget? child,
                            ) {
                              if (productList.isEmpty) {
                                return NoProductData(onRefresh: () async{
                                  List<ProductModel> productList =
                                  await dataController.getProductData();
                                  if (productList.isNotEmpty) {
                                    setState(() {});
                                  }
                                });
                              }
                              return LiquidPullToRefresh(
                                showChildOpacityTransition: false,
                                animSpeedFactor: 2,
                                backgroundColor: whiteColor,
                                color: appPrimaryColor,
                                height: 150,
                                springAnimationDurationInMilliseconds: 1300,
                                onRefresh: () async {
                                  productListNotifier.value =
                                      await dataController.getProductData();
                                },
                                child: GridView.builder(
                                  itemCount: productList.length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: (orientation ==
                                                  Orientation.portrait)
                                              ? 2
                                              : 3,
                                          crossAxisSpacing: 2,
                                          mainAxisSpacing: 1,
                                          childAspectRatio: (orientation ==
                                                  Orientation.portrait)
                                              ? 0.7
                                              : 0.8),
                                  itemBuilder: (context, index) {
                                    return ProductListLayout(
                                      orientation: orientation,
                                      product: productList[index],
                                      removeFromList: () {
                                        showAlertDialog(index, productList);
                                      },
                                      editScreenNavigation: () {
                                        Navigator.pushNamed(
                                            context, Routes.updateProductScreen,
                                            arguments: {
                                              "dataRepository": dataController,
                                              "product": productList[index],
                                            }).then((message) {
                                          if (message != null) {
                                            postUpdateMessage(
                                                message.toString());
                                          }
                                          setState(() {});
                                        });
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(
                          color: appPrimaryColor,
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.addProductScreen,
                  arguments: dataController)
              .then((message) {
            if (message != null) {
              postUpdateMessage(message.toString());
            }
            setState(() {});
          });
        },
        backgroundColor: appPrimaryColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.00)),
        child: const Icon(
          Icons.add,
          color: whiteColor,
          size: 30,
        ),
      ),
    );
  }

  void postUpdateMessage(String message) {
    Future.delayed(const Duration(milliseconds: 900), () {
      // ScaffoldMessenger.of(context).showSnackBar(
      //     appSnackbar(message, appPrimaryColor));
      showToast(content: message, context: context);
    });
  }

  Future<void> showAlertDialog(
      int index, List<ProductModel> productList) async {
    return showDialog(
      context: context,
      builder: (context) => AppAlertDialog(
        title: alertDialogWarningHeader,
        content: alertDialogDeleteContent,
        onAction: () {
          productListNotifier.value =
              dataController.removeProductData(productList, index);
          if (context.mounted) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
                appSnackbar(deleteProductSuccessful, appPrimaryColor));
          }
        },
      ),
    );
  }
}
