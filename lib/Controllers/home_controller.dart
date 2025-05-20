import 'package:deals_dray_test/Data/Networks/baseapiservice.dart';
import 'package:deals_dray_test/Data/Networks/network_api_service.dart';
import 'package:deals_dray_test/Data/app_exceptions.dart';
import 'package:deals_dray_test/Models/item_model.dart';
import 'package:deals_dray_test/Res/Apis/apis.dart';
import 'package:deals_dray_test/Utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  // Base API Service
  final BaseapiService _service = NetworkApiService();
  // Loading variable
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;
  // Item List
  final Rx<ItemModel> _itemData = ItemModel.defaultmodel.obs;
  Rx<ItemModel> get itemsData => _itemData;

  // Fetch Items
  Future<void> fetchItems() async {
    try {
      _isLoading.value = true;
      final response = await _service.get(Apis.homeUrl);
      if (response != null && response['status'] == 1) {
        _itemData.value = ItemModel.defaultmodel;
        _itemData.value = ItemModel.fromJson(response['data']);
      } else {
        AppUtils.showSnackBar(
          title: "Error",
          message: response["data"]['message'] ?? "Something went wrong",
          isError: true,
        );
        debugPrint("Error fetching items: ${response['message']}");
      }
      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
      if (e is AppExceptions) {
        AppUtils.showSnackBar(
          title: "Error",
          message: e.message ?? "Something went wrong",
          isError: true,
        );
      } else {
        AppUtils.showSnackBar(
          title: "Error",
          message: "Error getting items",
          isError: true,
        );
      }

      debugPrint("Error fetching items: $e");
    }
  }
}
