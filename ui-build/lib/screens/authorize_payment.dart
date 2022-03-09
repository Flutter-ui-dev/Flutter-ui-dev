import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neumorphismtest/data/card_data.dart';
import 'package:neumorphismtest/widgets/card_ui.dart';

import '../data/bills_data.dart';

class AuthorizePayment extends StatefulWidget {
  const AuthorizePayment({Key? key, required this.bill, required this.card})
      : super(key: key);

  final Bill bill;
  final BankCard card;

  @override
  _AuthorizePaymentState createState() => _AuthorizePaymentState();
}

class _AuthorizePaymentState extends State<AuthorizePayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back),
            ),
            SizedBox(height: 32.h),
            Container(
              height: 202.h,
              child: Hero(tag: '0', child: CardUI(card: widget.card)),
            ),
            SizedBox(height: 32.h),
            SizedBox(height: 32.h),
            SizedBox(height: 32.h),
          ],
        ),
      ),
    );
  }
}
