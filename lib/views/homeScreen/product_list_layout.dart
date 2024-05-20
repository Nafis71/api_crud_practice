import 'package:api_crud_practice/models/product_model.dart';
import 'package:flutter/material.dart';
import '../../themes/text_theme.dart';
import '../../utils/colors.dart';

class ProductListLayout extends StatelessWidget {
  final List<ProductModel> productList;
  final Function removeFromList;
  final int index;
  const ProductListLayout({super.key, required this.productList, required this.removeFromList, required this.index});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: whiteColor,
      child: ListTile(
        tileColor: tileColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.00),
        ),
        contentPadding: const EdgeInsets.all(10.00),
        leading: Container(
          height:
          MediaQuery.of(context).size.height * 0.1,
          width:
          MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(productList[index].img),fit: BoxFit.fill),
              shape: BoxShape.circle),
        ),
        title: Text(
          productList[index].productName,
          style: TextThemes.getTextStyle(
              fontSize: 15, fontWeight: FontWeight.w700),
        ),
        subtitle: Wrap(
          children: [
            Text(
              "Unit Price: ${productList[index].unitPrice}\$",
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "QTY: ${productList[index].qty}",
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Total Price: ${productList[index].totalPrice}\$",
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
              onPressed: () => removeFromList(),
              icon: const Icon(
                Icons.delete,
                color: redColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
