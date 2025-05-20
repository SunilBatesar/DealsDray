import 'package:cached_network_image/cached_network_image.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCachedImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double? borderRadius;

  const CustomCachedImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    Widget image = CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder:
          (context, url) => Center(
            child: CircularProgressIndicator(
              strokeWidth: 4,
              color: cnstSheet.colors.primary,
            ),
          ),
      errorWidget:
          (context, url, error) =>
              Icon(Icons.error, color: cnstSheet.colors.red, size: 30.sp),
    );

    if (borderRadius != null) {
      image = ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
        child: image,
      );
    }
    return image;
  }
}
