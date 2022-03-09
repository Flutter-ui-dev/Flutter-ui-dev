import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphismtest/data/transaction_data.dart';

import '../constant.dart';

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Transactions',
            style: headingStyle,
          ),
          SizedBox(height: 24.h),
          ListView.separated(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: transactionData.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 24.h);
            },
            itemBuilder: (BuildContext context, int index) {
              final transaction = transactionData[index];
              return _TransactionListTile(
                title: transaction.name,
                subtitle: 'Paid with',
                paidWith: transaction.paidWith,
                amount: transaction.amount,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TransactionListTile extends StatelessWidget {
  const _TransactionListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.paidWith,
    required this.amount,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String amount;
  final String paidWith;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12.r,
                letterSpacing: 0.4,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6.h),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 10.r,
                  letterSpacing: 0.1,
                  color: greyColor,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(text: subtitle),
                  TextSpan(
                    text: " " + paidWith,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        Text(
          "Rs " + amount,
          style: TextStyle(
            fontSize: 12.r,
            letterSpacing: 0.2,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
    return Container();
  }
}
