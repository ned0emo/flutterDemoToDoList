// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `To apply the theme, restart the application`
  String get changeThemeNotify {
    return Intl.message(
      'To apply the theme, restart the application',
      name: 'changeThemeNotify',
      desc: '',
      args: [],
    );
  }

  /// `To apply the language, restart the application`
  String get changeLanguageNotify {
    return Intl.message(
      'To apply the language, restart the application',
      name: 'changeLanguageNotify',
      desc: '',
      args: [],
    );
  }

  /// `wrong email format`
  String get wrongEmail {
    return Intl.message(
      'wrong email format',
      name: 'wrongEmail',
      desc: '',
      args: [],
    );
  }

  /// `wrong password format`
  String get wrongPassword {
    return Intl.message(
      'wrong password format',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Add task`
  String get addTask {
    return Intl.message(
      'Add task',
      name: 'addTask',
      desc: '',
      args: [],
    );
  }

  /// `Enter the task text`
  String get inputTaskText {
    return Intl.message(
      'Enter the task text',
      name: 'inputTaskText',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `To Do List`
  String get toDoList {
    return Intl.message(
      'To Do List',
      name: 'toDoList',
      desc: '',
      args: [],
    );
  }

  /// `Active`
  String get inProcess {
    return Intl.message(
      'Active',
      name: 'inProcess',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Authentication error`
  String get authenticationError {
    return Intl.message(
      'Authentication error',
      name: 'authenticationError',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get loginCapital {
    return Intl.message(
      'LOGIN',
      name: 'loginCapital',
      desc: '',
      args: [],
    );
  }

  /// `CREATE ACCOUNT`
  String get createAccountCapital {
    return Intl.message(
      'CREATE ACCOUNT',
      name: 'createAccountCapital',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN WITH GOOGLE`
  String get googleLogin {
    return Intl.message(
      'LOGIN WITH GOOGLE',
      name: 'googleLogin',
      desc: '',
      args: [],
    );
  }

  /// `Registration error`
  String get registerError {
    return Intl.message(
      'Registration error',
      name: 'registerError',
      desc: '',
      args: [],
    );
  }

  /// `confirm password`
  String get passwordConfirm {
    return Intl.message(
      'confirm password',
      name: 'passwordConfirm',
      desc: '',
      args: [],
    );
  }

  /// `passwords don"t match`
  String get passwordNotEqual {
    return Intl.message(
      'passwords don"t match',
      name: 'passwordNotEqual',
      desc: '',
      args: [],
    );
  }

  /// `REGISTER`
  String get registerCapital {
    return Intl.message(
      'REGISTER',
      name: 'registerCapital',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Error loading the list`
  String get listLoadError {
    return Intl.message(
      'Error loading the list',
      name: 'listLoadError',
      desc: '',
      args: [],
    );
  }

  /// `To add a task, click the "+" button`
  String get addTaskTip {
    return Intl.message(
      'To add a task, click the "+" button',
      name: 'addTaskTip',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get unknownError {
    return Intl.message(
      'Unknown error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `No completed tasks`
  String get completedTaskIsEmpty {
    return Intl.message(
      'No completed tasks',
      name: 'completedTaskIsEmpty',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
