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

      // sort data by start join date
      result.results.sort((a, b) => b.properties.joinDate.date.start
          .compareTo(a.properties.joinDate.date.start));

      // changes the data into experience object
      List<Experience> experience = [];
      for (var i = 0; i < result.results.length; i++) {
        final data = result.results[i];
        experience.add(
          Experience(
            no: result.results.length - i,
            title: data.properties.getCompanyName,
            role: data.properties.getRole,
            date:
                "${data.properties.getStartDate} - ${data.properties.getEndDate}",
            description: data.properties.getDescription,
          ),
        );
      }
      return experience;
    } on DioError catch (e) {
      print("error apa ini:  $e");
      throw Exception(Utility.handleError(e));
    }
  }
}
