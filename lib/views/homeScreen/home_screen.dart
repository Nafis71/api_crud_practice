import 'package:api_crud_practice/controllers/data_controller.dart';
import 'package:api_crud_practice/controllers/data_repository.dart';
import 'package:api_crud_practice/models/product_model.dart';
import 'package:api_crud_practice/services/api_service.dart';
import 'package:api_crud_practice/themes/text_theme.dart';
import 'package:api_crud_practice/utils/colors.dart';
import 'package:api_crud_practice/utils/routes.dart';
import 'package:api_crud_practice/views/homeScreen/product_list_layout.dart';
import 'package:api_crud_practice/views/widgets/app_alert_dialog.dart';
import 'package:api_crud_practice/views/widgets/app_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

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
      ),
      body: LiquidPullToRefresh(
        showChildOpacityTransition: false,
        animSpeedFactor: 2,
        backgroundColor: whiteColor,
        color: appPrimaryColor,
        height: 140,
        springAnimationDurationInMilliseconds: 1100,
        onRefresh: () async {
          productListNotifier.value = await dataController.getProductData();
        },
        child: Container(
          margin: const EdgeInsets.all(8.00),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                homeScreenProductDataHeader,
                style: TextThemes.getTextStyle(
                    color: greyColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: FutureBuilder(
                  future: dataController.getProductData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      productListNotifier.value = snapshot.data!;
                      return Visibility(
                        visible: true,
                        replacement: const Center(
                          child: CircularProgressIndicator(
                            color: appPrimaryLightColor,
                          ),
                        ),
                        child: ValueListenableBuilder<List<ProductModel>>(
                          valueListenable: productListNotifier,
                          builder: (
                            BuildContext context,
                            List<ProductModel> productList,
                            Widget? child,
                          ) {
                            return ListView.separated(
                              itemCount: productList.length,
                              itemBuilder: (context, index) {
                                return ProductListLayout(
                                  productList: productList,
                                  index: index,
                                  removeFromList: () {
                                   showAlertDialog(index,productList);
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Gap(10.00);
                              },
                            );
                          },
                        ),
                      );
                    }
                    return const Center(
                        child: CircularProgressIndicator(
                      color: appPrimaryColor,
                    ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.addProductScreen,
                  arguments: dataController)
              .then((value) {
            if (value != null && value == true) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(appSnackbar(addProductSuccessfulText,appPrimaryColor));
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
  Future showAlertDialog(int index,List<ProductModel> productList){
    return showDialog(context: context, builder: (context) => AppAlertDialog(title: alertDialogWarningHeader,content: alertDialogDeleteContent, onAction: (){
      productListNotifier.value = dataController.removeProductData(productList, index);
    },));
  }
}
