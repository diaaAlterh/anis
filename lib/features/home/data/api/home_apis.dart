import 'dart:convert';

import 'package:anis/core/consts/consts.dart';
import 'package:anis/features/home/data/models/company_info_model.dart';
import 'package:anis/features/home/data/models/slider_model.dart';
import 'package:dio/dio.dart';

class HomeApis {
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: requestHeaders));

  Future<SliderModel> getSlider() async {
    final response = await _dio.get('/Slider');
    return SliderModel.fromJson(response.data);
  }

  Future<CompanyInfoModel> getCompanyInfo() async {
    final response = await _dio.get('/home');
    return CompanyInfoModel.fromJson(response.data);
  }
}
