import 'package:deals_dray_test/Components/Cards/product_card.dart';
import 'package:deals_dray_test/Components/Constants/style_sheet.dart';
import 'package:deals_dray_test/Models/item_model.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExclusiveProductsWidget extends StatelessWidget {
  final List<Product> products;
  ExclusiveProductsWidget({super.key, required this.products});
  final AppTextTheme textTheme = AppTextTheme();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cnstSheet.services.screenWidth(context),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: cnstSheet.colors.tealBlue,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cnstSheet.colors.tealBlue,
            cnstSheet.colors.tealBlue,
            cnstSheet.colors.tealBlue.withAlpha(200),
            cnstSheet.colors.tealBlue.withAlpha(160),
          ],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EXCLUSIVE FOR YOU',
                  style: textTheme.fs24Bold.copyWith(
                    color: cnstSheet.colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward,
                    color: cnstSheet.colors.white,
                    size: 30.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: cnstSheet.services.screenHeight(context) * 0.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  // Product card
                  child: ProductCard(product: products[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
