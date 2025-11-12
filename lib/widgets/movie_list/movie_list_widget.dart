import 'package:flutter/material.dart';
import 'package:the_movie_db/gen/assets.gen.dart';

class Movie {
  final int id;
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({
    required this.id,
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
      id: 1,
      imageName: Assets.images.mortalCombat.path,
      title: 'Смертельная битва',
      time: "April 7, 2021",
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id: 2,
      imageName: Assets.images.mortalCombat.path,
      title: 'Прибытие',
      time: "April 7, 2021",
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id: 3,
      imageName: Assets.images.mortalCombat.path,
      title: 'Назад в будущее',
      time: "April 7, 2021",
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id: 4,
      imageName: Assets.images.mortalCombat.path,
      title: 'Назад в будущее 2',
      time: "April 7, 2021",
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id: 5,
      imageName: Assets.images.mortalCombat.path,
      title: 'Назад в будущее',
      time: "April 7, 2021",
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id: 6,
      imageName: Assets.images.mortalCombat.path,
      title: 'Назад в будущее 3',
      time: "April 7, 2021",
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id: 7,
      imageName: Assets.images.mortalCombat.path,
      title: 'Человек паук',
      time: "April 7, 2021",
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
    Movie(
      id: 8,
      imageName: Assets.images.mortalCombat.path,
      title: 'Пиксели',
      time: "April 7, 2021",
      description: 'Washed-up MMA fighter Cole Young, unaware of his heritage',
    ),
  ];

  var _filterdMovies = <Movie>[];

  final _SearchController = TextEditingController();

  void _searchMovies() {
    final query = _SearchController.text;
    if (query.isNotEmpty) {
      _filterdMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filterdMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    _filterdMovies = _movies;
    _SearchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(
      context,
    ).pushNamed('/main_screen/movie_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          padding: const EdgeInsets.only(top: 70),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          itemCount: _filterdMovies.length,
          itemExtent: 163,
          itemBuilder: (BuildContext context, int index) {
            final movie = _filterdMovies[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.2),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Image(image: AssetImage(movie.imageName)),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                movie.time,
                                style: const TextStyle(color: Colors.grey),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                movie.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => _onMovieTap(index),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _SearchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
