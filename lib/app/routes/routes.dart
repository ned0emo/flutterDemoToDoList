import 'package:flutter/material.dart';
import 'package:fluttertest/app/app.dart';
import 'package:fluttertest/login/login.dart';

import '../../home/view/home_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page()];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
