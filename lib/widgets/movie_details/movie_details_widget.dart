import 'package:flutter/material.dart';
import 'package:the_movie_db/widgets/movie_details/movie_main_info.dart';
import 'package:the_movie_db/widgets/movie_details/movie_screen_cast.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;
  const MovieDetailsWidget({super.key, required this.movieId});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Мортал Комбат",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ColoredBox(
        color: const Color.fromRGBO(32, 11, 11, 1),
        child: ListView(
          children: const [
            MovieMainInfoWidget(),
            SizedBox(
              height: 30,
            ),
            MovieScreenCast(),
          ],
        ),
      ),
    );
  }
}
