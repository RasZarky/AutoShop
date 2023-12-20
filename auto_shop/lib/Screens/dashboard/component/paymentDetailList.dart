import 'package:auto_shop/Screens/dashboard/component/paymentListTile.dart';
import 'package:flutter/material.dart';

import '../config/size_config.dart';
import '../data.dart';
import '../style/colors.dart';
import '../style/style.dart';


class PaymentDetailList extends StatelessWidget {
  const PaymentDetailList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
              text: 'Recent Activities', size: 18, fontWeight: FontWeight.w800),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 2,
      ),
      Column(
        children: List.generate(
          recentActivities.length,
          (index) => PaymentListTile(
              icon: recentActivities[index]["icon"] as String,
              label: recentActivities[index]["label"] as String,
              amount: recentActivities[index]["amount"] as String),
        ),
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 5,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
              text: 'Upcoming Events', size: 18, fontWeight: FontWeight.w800),
        ],
      ),
      SizedBox(
        height: SizeConfig.blockSizeVertical! * 2,
      ),
      Column(
        children: List.generate(
          upcomingPayments.length,
          (index) => PaymentListTile(
              icon: upcomingPayments[index]["icon"] as String,
              label: upcomingPayments[index]["label"] as String,
              amount: upcomingPayments[index]["amount"] as String),
        ),
      ),
    ]);
  }
}
