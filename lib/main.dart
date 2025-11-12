import 'package:flutter/material.dart';
import 'package:the_movie_db/widgets/auth/auth_widget.dart';
import 'package:the_movie_db/widgets/main_screen/main_screen_widget.dart';
import 'package:the_movie_db/theme/app_colors.dart';
import 'package:the_movie_db/widgets/movie_details/movie_details_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(222, 226, 230, 1),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/auth': (context) => const AuthWidget(),
        '/main_screen': (context) => const MainScreenWidget(),
        '/main_screen/movie_details': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is int) {
            return MovieDetailsWidget(movieId: arguments);
          } else {
            return const MovieDetailsWidget(movieId: 0);
          }
        },
      },
      initialRoute: '/auth',
    );
  }
}
