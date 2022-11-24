// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "add": MessageLookupByLibrary.simpleMessage("Add"),
        "addTask": MessageLookupByLibrary.simpleMessage("Add task"),
        "addTaskTip": MessageLookupByLibrary.simpleMessage(
            "To add a task, click the \"+\" button"),
        "authenticationError":
            MessageLookupByLibrary.simpleMessage("Authentication error"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "changeLanguageNotify": MessageLookupByLibrary.simpleMessage(
            "To apply the language, restart the application"),
        "changeThemeNotify": MessageLookupByLibrary.simpleMessage(
            "To apply the theme, restart the application"),
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "completedTaskIsEmpty":
            MessageLookupByLibrary.simpleMessage("No completed tasks"),
        "createAccountCapital":
            MessageLookupByLibrary.simpleMessage("CREATE ACCOUNT"),
        "email": MessageLookupByLibrary.simpleMessage("email"),
        "googleLogin":
            MessageLookupByLibrary.simpleMessage("LOGIN WITH GOOGLE"),
        "inProcess": MessageLookupByLibrary.simpleMessage("Active"),
        "inputTaskText":
            MessageLookupByLibrary.simpleMessage("Enter the task text"),
        "listLoadError":
            MessageLookupByLibrary.simpleMessage("Error loading the list"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "loginCapital": MessageLookupByLibrary.simpleMessage("LOGIN"),
        "password": MessageLookupByLibrary.simpleMessage("password"),
        "passwordConfirm":
            MessageLookupByLibrary.simpleMessage("confirm password"),
        "passwordNotEqual":
            MessageLookupByLibrary.simpleMessage("passwords don\"t match"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "registerCapital": MessageLookupByLibrary.simpleMessage("REGISTER"),
        "registerError":
            MessageLookupByLibrary.simpleMessage("Registration error"),
        "toDoList": MessageLookupByLibrary.simpleMessage("To Do List"),
        "unknownError": MessageLookupByLibrary.simpleMessage("Unknown error"),
        "wrongEmail":
            MessageLookupByLibrary.simpleMessage("wrong email format"),
        "wrongPassword":
            MessageLookupByLibrary.simpleMessage("wrong password format")
      };
}
