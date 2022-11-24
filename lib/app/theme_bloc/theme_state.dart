part of 'theme_cubit.dart';

class ThemeState {
  final ThemeData theme;

  ThemeState({required this.theme});
}

class ThemeLight extends ThemeState {
  ThemeLight()
      : super(
            theme: ThemeData(
          primaryColorDark: Colors.deepPurple,
          primaryColorLight: Colors.deepPurpleAccent,
          primaryColor: Colors.pink,
          colorScheme: const ColorScheme.light(secondary: Colors.pinkAccent),
          scaffoldBackgroundColor: Colors.white,
        ));
}

class ThemeDark extends ThemeState {
  ThemeDark()
      : super(
            theme: ThemeData(
          primaryColorDark: Colors.deepPurple,
          primaryColorLight: Colors.deepPurpleAccent,
          primaryColor: Colors.purple,
          colorScheme: const ColorScheme.dark(secondary: Colors.purpleAccent),
          scaffoldBackgroundColor: Colors.black54,
        ));
}
