import 'package:deals_dray_test/Components/Constants/style_sheet.dart';
import 'package:deals_dray_test/Components/custom_cached_image.dart';
import 'package:deals_dray_test/Components/drawer_widget.dart';
import 'package:deals_dray_test/Controllers/home_controller.dart';
import 'package:deals_dray_test/Res/Services/app_config.dart';
import 'package:deals_dray_test/Views/Home/Widgets/exclusive_products_widget.dart';
import 'package:deals_dray_test/Views/Home/Widgets/kyc_banner.dart';
import 'package:deals_dray_test/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Home Controller
  final homeController = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    getData();
  }

  // Get Data
  getData() async {
    await homeController.fetchItems();
  }

  final AppTextTheme textTheme = AppTextTheme();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with search field
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search here',
                  helperStyle: textTheme.fs14Normal.copyWith(
                    color: cnstSheet.colors.secondary,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.r),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: cnstSheet.colors.grey.withAlpha(35),
                  contentPadding: EdgeInsets.all(20.sp),
                  prefixIcon: CircleAvatar(
                    radius: 20.r,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: Image.asset(
                        AppConfig.secondaryAppLogo,
                        width: 30.sp,
                        height: 30.sp,
                      ),
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    color: cnstSheet.colors.grey,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications_none,
              size: 30.sp,
              color: cnstSheet.colors.grey,
            ),
            onPressed: () {
              getData();
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0.sp),
          child: Obx(() {
            final item = homeController.itemsData.value;
            return homeController.isLoading.value
                ? SizedBox()
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Advertisement slider
                    SizedBox(
                      height: cnstSheet.services.screenHeight(context) * 0.20,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: item.bannerOne.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: CustomCachedImage(
                                imageUrl: item.bannerOne[index].image,
                                width:
                                    cnstSheet.services.screenWidth(context) *
                                    0.8,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Gap(20.h),
                    // Banner for KYC
                    KYCBanner(),
                    Gap(20.h),
                    // Categories Section
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        width: cnstSheet.services.screenWidth(context) * 0.9,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(item.category.length, (
                            index,
                          ) {
                            return GestureDetector(
                              onTap: () {},
                              child: Column(
                                children: [
                                  CustomCachedImage(
                                    imageUrl: item.category[index].icon,
                                    width: 60.w,
                                    height: 60.h,
                                    fit: BoxFit.contain,
                                  ),
                                  Gap(8.h),
                                  Text(
                                    item.category[index].label,
                                    style: TextStyle(fontSize: 14.sp),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Gap(20.h),
                    // Products Section
                    // Exclusive Products Section
                    ExclusiveProductsWidget(products: item.unboxedDeals),
                  ],
                );
          }),
        ),
      ),
    );
  }
}
