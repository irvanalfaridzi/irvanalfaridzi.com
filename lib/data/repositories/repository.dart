import 'dart:convert';

import 'package:alfaridzi_me/data/models/models.dart';
import 'package:alfaridzi_me/services/call_service.dart';
import 'package:alfaridzi_me/services/locator.dart';
import 'package:alfaridzi_me/utils/constant.dart';
import 'package:alfaridzi_me/utils/utility.dart';
import 'package:dio/dio.dart';

class Repository {
  var callService = locator<CallService>();
  Future<List<Experience>> getListExperience() async {
    try {
      List<Experience> experiences = [];
      final response = await callService.connect(
        Constant.listExperience,
        {},
        Constant.post,
      );
      await Future.delayed(const Duration(milliseconds: 2000));

      // request API
      ApiResult result = apiResultFromJson(json.encode(response.data));

      // changes the data into experience object
      for (var i = 0; i < result.results.length; i++) {
        final data = result.results[i];
        experiences.add(Experience.fromJson(data.resultData, i));
      }

      // sort data by start join date
      experiences.sort((a, b) => b.startDate.compareTo(a.startDate));

      return experiences;
    } on DioError catch (e) {
      throw Exception(Utility.handleError(e));
    }
  }
}
