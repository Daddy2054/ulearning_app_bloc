import 'package:flutter/foundation.dart';

import '../entities/entities.dart';
import '../utils/http_util.dart';

class CourseAPI {
  static Future<CourseListResponseEntity> courseList() async {
    var response = await HttpUtil().post(
      'api/courseList',
    );
    if (kDebugMode) {
      print(response.toString());
    }

    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> recommendedCourseList() async {
    var response = await HttpUtil().post(
      'api/recommendedCourseList',
    );

    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> search(
      {SearchRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/searchCourseList',
      queryParameters: params?.toJson(),
    );
    // print(response.toString());
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> coursesBought() async {
    var response = await HttpUtil().post(
      'api/coursesBought',
    );
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<CourseDetailResponseEntity> courseDetail(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/courseDetail',
      queryParameters: params?.toJson(),
    );
    print(response.toString());
    return CourseDetailResponseEntity.fromJson(response);
  }

  //for course payment
  static Future<BaseResponseEntity> coursePay(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/checkout',
      queryParameters: params?.toJson(),
    );

    return BaseResponseEntity.fromJson(response);
  }

  //for checking one item bought
  static Future<BaseResponseEntity> courseBought(
      {CourseRequestEntity? params}) async {
    var response = await HttpUtil().post(
      'api/courseBought',
      queryParameters: params?.toJson(),
    );

    return BaseResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> orderList() async {
    var response = await HttpUtil().post(
      'api/orderList',
    );
    return CourseListResponseEntity.fromJson(response);
  }

  static Future<AuthorResponseEntity> courseAuthor(
      AuthorRequestEntity? params) async {
    var response = await HttpUtil().post(
      'api/courseAuthor',
      queryParameters: params!.toJson(),
    );
    return AuthorResponseEntity.fromJson(response);
  }

  static Future<CourseListResponseEntity> courseListAuthor(
      AuthorRequestEntity? params) async {
    var response = await HttpUtil().post(
      'api/courseListAuthor',
      queryParameters: params!.toJson(),
    );
    return CourseListResponseEntity.fromJson(response);
  }
}
