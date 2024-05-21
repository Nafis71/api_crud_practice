import 'package:api_crud_practice/models/product_model.dart';
import 'package:flutter/material.dart';
import '../../themes/text_theme.dart';
import '../../utils/colors.dart';

class ProductListLayout extends StatelessWidget {
  final List<ProductModel> productList;
  final Function removeFromList;
  final int index;
  final Orientation orientation;

  const ProductListLayout(
      {super.key,
      required this.productList,
      required this.removeFromList,
      required this.index, required this.orientation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
              color: blackColor.withOpacity(0.15),
              blurRadius: 20.00,
              spreadRadius: 2.00,
              offset: const Offset(0, 5))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.00),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: (orientation == Orientation.portrait) ? MediaQuery.of(context).size.height * 0.15 : MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                color: const Color(0xFFFBFBFB),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8.00),
                    topLeft: Radius.circular(8.00)),
                image: DecorationImage(
                  image: NetworkImage(productList[index].img,),
                  fit: BoxFit.scaleDown,
                ),
              ),
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => removeFromList(),
                        icon: const Icon(
                          Icons.delete,
                          color: redColor,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.edit,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              height: 1.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          productList[index].productName,
                          style: TextThemes.getTextStyle(
                              fontSize: 13.5, fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          "Unit Price: BDT ${productList[index].unitPrice}",
                          style: TextThemes.getTextStyle(
                              fontSize: 11,
                              color: greyColor,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Wrap(
                    children: [
                      Text(
                        "QTY: ${productList[index].qty}",
                        style: TextThemes.getTextStyle(
                          fontSize: 13,
                          color: greyColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Wrap(
                    children: [
                      Text(
                        "BDT ${productList[index].totalPrice}",
                        style: TextThemes.getTextStyle(
                            fontSize: 14,
                            color: appPrimaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
