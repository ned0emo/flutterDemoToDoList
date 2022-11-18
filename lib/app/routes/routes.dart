import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/app/app.dart';
import 'package:fluttertest/login/login.dart';

import '../../home/view/home_page.dart';

List<Page<dynamic>> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
  AuthenticationRepository repo,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomePage.page(repo.currentUser.id)];
    case AppStatus.unauthenticated:
      return [LoginPage.page()];
  }
}
