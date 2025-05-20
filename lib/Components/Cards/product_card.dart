import 'package:deals_dray_test/Components/Constants/style_sheet.dart';
import 'package:deals_dray_test/Components/custom_cached_image.dart';
import 'package:deals_dray_test/Models/item_model.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({super.key, required this.product});
  final AppTextTheme textTheme = AppTextTheme();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: cnstSheet.colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding: EdgeInsets.all(10.0.sp),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Stack(
              children: [
                CustomCachedImage(
                  imageUrl: product.icon,
                  width: 200.sp,
                  height: 200.sp,
                  fit: BoxFit.contain,
                ),

                // Product discount
                Positioned(
                  top: 5.h,
                  right: 0.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: cnstSheet.colors.green,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text(
                      '${product.offer} off',
                      style: textTheme.fs14Bold.copyWith(
                        color: cnstSheet.colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gap(8.h),
            SizedBox(
              width: 200.w,
              child: Text(
                product.label,
                maxLines: 1,
                style: textTheme.fs16Medium.copyWith(
                  color: cnstSheet.colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
