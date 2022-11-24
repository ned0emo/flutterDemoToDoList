// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Добавить"),
        "addTask": MessageLookupByLibrary.simpleMessage("Добавить задачу"),
        "addTaskTip": MessageLookupByLibrary.simpleMessage(
            "Чтобы добавить задачу, нажмите на кнопку \"+\""),
        "authenticationError":
            MessageLookupByLibrary.simpleMessage("Ошибка аутентификации"),
        "cancel": MessageLookupByLibrary.simpleMessage("Отмена"),
        "completed": MessageLookupByLibrary.simpleMessage("Завершенные"),
        "completedTaskIsEmpty":
            MessageLookupByLibrary.simpleMessage("Нет завершенных задач"),
        "createAccountCapital":
            MessageLookupByLibrary.simpleMessage("СОЗДАТЬ АККАУНТ"),
        "googleLogin":
            MessageLookupByLibrary.simpleMessage("ВХОД ЧЕРЕЗ GOOGLE"),
        "inProcess": MessageLookupByLibrary.simpleMessage("В процессе"),
        "inputTaskText":
            MessageLookupByLibrary.simpleMessage("Введите текст задачи"),
        "listLoadError":
            MessageLookupByLibrary.simpleMessage("Ошибка загрузки списка"),
        "login": MessageLookupByLibrary.simpleMessage("Вход"),
        "loginCapital": MessageLookupByLibrary.simpleMessage("ВХОД"),
        "password": MessageLookupByLibrary.simpleMessage("пароль"),
        "passwordConfirm":
            MessageLookupByLibrary.simpleMessage("подтвердите пароль"),
        "passwordNotEqual":
            MessageLookupByLibrary.simpleMessage("пароли не совпадают"),
        "register": MessageLookupByLibrary.simpleMessage("Регистрация"),
        "registerCapital": MessageLookupByLibrary.simpleMessage("РЕГИСТРАЦИЯ"),
        "registerError":
            MessageLookupByLibrary.simpleMessage("Ошибка регистрации"),
        "toDoList": MessageLookupByLibrary.simpleMessage("Список задач"),
        "unknownError":
            MessageLookupByLibrary.simpleMessage("Неизвестная ошибка"),
        "wrongEmail": MessageLookupByLibrary.simpleMessage(
            "неправильный формат электронной почты"),
        "wrongPassword":
            MessageLookupByLibrary.simpleMessage("неправильный формат пароля")
      };
}
