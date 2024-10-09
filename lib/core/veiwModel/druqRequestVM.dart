
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pharmcy/core/models/drugRequest.dart';
import 'package:pharmcy/core/veiwModel/donationvm.dart';

import '../constant/api_url.dart';
class DruqRequestVM with ChangeNotifier{
  bool isLoading = false;
  String? errorMessage;
  String token = storageHelper.readKey("token");
  
  Future<void> sendDrug(DrugRequest drug) async {
    isLoading = true;
    notifyListeners();

    Dio dio = Dio();
    try {
      Response res = await dio.post(ApiUrls.donationUrl,
          data: drug.toJson(),
          options: Options(headers: {'Authorization': 'Bearer $token'}));
      if (res.statusCode == 200) {
        print('Sucsses');
        //donations.add(donation);
        errorMessage = null;
      } else {
        errorMessage = 'فشل في إرسال البيانات';
      }
    } catch (e) {
      errorMessage = 'حدث خطأ أثناء إرسال البيانات: $e';
      print('Exception is $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  

}