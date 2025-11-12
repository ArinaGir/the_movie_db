import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/gen/assets.gen.dart';

class MovieScreenCast extends StatelessWidget {
  const MovieScreenCast({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 80, left: 15, bottom: 10),
            child: Text(
              'В главных ролях',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 246,
            child: Scrollbar(
              thumbVisibility: true,
              interactive: true,
              child: ListView.separated(
                itemCount: 5,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(width: 15),
                itemBuilder: (BuildContext context, int index) => SizedBox(
                  width: 122,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black.withValues(alpha: 0.2),
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image(
                            image: AssetImage(Assets.images.actor.path),
                            fit: BoxFit.cover,
                            height: 133,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Льюис Тан',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'Cole Young',
                                  maxLines: 2,
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Полный актерский и съемочный состав',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
