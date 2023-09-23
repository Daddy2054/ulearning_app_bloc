//unify BlocProvider and routes and pages
import 'package:flutter/material.dart';

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
