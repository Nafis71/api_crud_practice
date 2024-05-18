import 'package:api_crud_practice/controllers/data_controller.dart';
import 'package:api_crud_practice/models/product_model.dart';
import 'package:api_crud_practice/services/api_service.dart';
import 'package:api_crud_practice/themes/text_theme.dart';
import 'package:api_crud_practice/utils/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/text_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final DataController dataController;
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
      body: Container(
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
                    List<ProductModel> productList = snapshot.data!;
                    return Visibility(
                      visible: true,
                      replacement: const Center(
                          child: CircularProgressIndicator(
                        color: appPrimaryLightColor,
                      )),
                      child: ListView.separated(
                        itemCount: productList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              contentPadding: const EdgeInsets.all(10.00),
                              leading: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width:
                                    MediaQuery.of(context).size.height * 0.08,
                                decoration: BoxDecoration(
                                    //TODO will remove the color later
                                    image: DecorationImage(image: NetworkImage(productList[index].img),fit: BoxFit.fill),
                                    shape: BoxShape.circle),
                              ),
                              title: Text(
                                productList[index].productName,
                                style: TextThemes.getTextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w700),
                              ),
                              subtitle: const Wrap(
                                children: [
                                  Text(
                                    "Unit Price: 72\$",
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "QTY: 7",
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Total Price: 3327\$",
                                  ),
                                ],
                              ),
                              trailing: Wrap(
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.edit,
                                      color: appPrimaryColor,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                      color: redColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 5,
                            );
                          },),
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
    );
  }
}
