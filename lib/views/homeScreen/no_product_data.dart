import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

import '../../utils/colors.dart';

class NoProductData extends StatelessWidget {
  final Function onRefresh;
  const NoProductData({super.key, required this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return LiquidPullToRefresh(
      showChildOpacityTransition: false,
      animSpeedFactor: 2,
      backgroundColor: whiteColor,
      color: appPrimaryColor,
      height: 150,
      springAnimationDurationInMilliseconds: 1300,
      onRefresh: () async {
        onRefresh();
      },
      child: ListView(
        children: [
          const Gap(60),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.5,
              child: SvgPicture.asset(
                  "assets/images/error.svg"),
            ),
          ),
          const Gap(10),
          const Center(child: Text("No product data found"))
        ],
      ),
    );
  }
}
