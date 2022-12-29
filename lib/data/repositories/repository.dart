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
      final response = await callService.connect(
        Constant.listExperience,
        {},
        Constant.post,
      );

      // request API
      ApiResult result = apiResultFromJson(json.encode(response.data));

      // changes the data into experience object
      List<Experience> experiences = [];
      for (var i = 0; i < result.results.length; i++) {
        final data = result.results[i];
        final no = result.results.length - i;
        experiences.add(Experience.fromJson(data.resultData, no));
      }

      // sort data by start join date
      experiences.sort((a, b) => b.joinDate.compareTo(a.joinDate));

      return experiences;
    } on DioError catch (e) {
      throw Exception(Utility.handleError(e));
    }
  }
}
