AppLanguage appLanguage = AppLanguage(language: 'ru');

class AppLanguage {
  final String language;

  final String email = 'email';

  ///Общие
  late String changeThemeNotify;
  late String changeLanguageNotify;
  late String wrongEmail;
  late String wrongPassword;
  late String password;

  ///HomeView
  late String addTask;
  late String inputTaskText;
  late String cancel;
  late String add;
  late String toDoList;
  late String inProcess;
  late String completed;

  ///LoginView
  late String login;
  late String authenticationError;
  late String loginCapital;
  late String createAccountCapital;
  late String googleLogin;

  ///RegisterView
  late String registerError;
  late String passwordConfirm;
  late String passwordNotEqual;
  late String registerCapital;
  late String register;

  ///Вкладки
  late String listLoadError;
  late String addTaskTip;
  late String unknownError;
  late String completedTaskIsEmpty;

  AppLanguage({required this.language}) {
    if (language == 'en') {
      changeThemeNotify = 'To apply the theme, restart the application';
      changeLanguageNotify = 'To apply the language, restart the application';
      wrongEmail = 'wrong email format';
      wrongPassword = 'wrong password format';
      password = 'password';

      addTask = 'Add task';
      inputTaskText = 'Enter the task text';
      cancel = 'Cancel';
      add = 'Add';
      toDoList = 'To Do List';
      inProcess = 'Active';
      completed = 'Completed';

      login = 'Login';
      authenticationError = 'Authentication error';
      loginCapital = 'LOGIN';
      createAccountCapital = 'CREATE ACCOUNT';
      googleLogin = 'LOGIN WITH GOOGLE';

      registerError = 'Registration error';
      passwordConfirm = 'confirm password';
      passwordNotEqual = 'passwords don\'t match';
      registerCapital = 'REGISTER';
      register = 'Register';

      listLoadError = 'Error loading the list';
      addTaskTip = 'To add a task, click the "+" button';
      unknownError = 'Unknown error';
      completedTaskIsEmpty = 'No completed tasks';

      return;
    }

    if (language == 'ru') {
      changeThemeNotify = 'Для применения темы перезагрузите приложение';
      changeLanguageNotify = 'Для применения языка перезагрузите приложение';
      wrongEmail = 'неправильный формат электронной почты';
      wrongPassword = 'неправильный формат пароля';
      password = 'пароль';

      addTask = 'Добавить задачу';
      inputTaskText = 'Введите текст задачи';
      cancel = 'Отмена';
      add = 'Добавить';
      toDoList = 'Список задач';
      inProcess = 'В процессе';
      completed = 'Завершенные';

      login = 'Вход';
      authenticationError = 'Ошибка аутентификации';
      loginCapital = 'ВХОД';
      createAccountCapital = 'СОЗДАТЬ АККАУНТ';
      googleLogin = 'ВХОД ЧЕРЕЗ GOOGLE';

      registerError = 'Ошибка регистрации';
      passwordConfirm = 'подтеврдите пароль';
      passwordNotEqual = 'пароли не совпадают';
      registerCapital = 'РЕГИСТРАЦИЯ';
      register = 'Регистрация';

      listLoadError = 'Ошибка загрузки списка';
      addTaskTip = 'Чтобы добавить задачу, нажмите кнопку \'+\'';
      unknownError = 'Неизвестная ошибка';
      completedTaskIsEmpty = 'Нет завершенных задач';

      return;
    }
  }
}
