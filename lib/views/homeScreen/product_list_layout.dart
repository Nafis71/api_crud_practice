import 'package:api_crud_practice/models/product_model.dart';
import 'package:api_crud_practice/views/homeScreen/product_description.dart';
import 'package:api_crud_practice/views/widgets/action_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class ProductListLayout extends StatelessWidget {
  final ProductModel product;
  final Function removeFromList, editScreenNavigation;
  final Orientation orientation;

  const ProductListLayout(
      {super.key,
      required this.product,
      required this.removeFromList,
      required this.orientation,
      required this.editScreenNavigation});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.0),
        boxShadow: [
          BoxShadow(
              color: blackColor.withOpacity(0.15),
              blurRadius: 20.00,
              spreadRadius: 2.00,
              offset: const Offset(0, 5))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: (orientation == Orientation.portrait)
                ? MediaQuery.of(context).size.height * 0.15
                : MediaQuery.of(context).size.height * 0.35,
            decoration: BoxDecoration(
              color: const Color(0xFFFBFBFB),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(13.00),
                  topLeft: Radius.circular(13.00)),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  product.img,
                ),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ActionContainer(
                        onPressedAction: removeFromList,
                        icon: Icons.delete,
                        color: redColor,
                      ),
                      ActionContainer(
                        onPressedAction: editScreenNavigation,
                        icon: Icons.edit,
                        color: blackColor,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 1.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductDescription(
                    text: product.productName,
                    maxLines: 2,
                    color: blackColor,
                    fontSize: 13.5,
                    fontWeight: FontWeight.w500),
                ProductDescription(
                    text: "Unit price: ${product.unitPrice}",
                    color: greyColor,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
                ProductDescription(
                    text: "QTY: ${product.qty}",
                    color: greyColor,
                    fontSize: 13,
                    fontWeight: FontWeight.normal),
              ],
            ),
          ),
          Wrap(
            children: [
              ProductDescription(
                  text: "BDT ${product.totalPrice}",
                  color: appPrimaryColor,
                  fontSize: 14,
                  maxLines: 1,
                  fontWeight: FontWeight.bold),
            ],
          ),
        ],
      ),
    );
  }
}
