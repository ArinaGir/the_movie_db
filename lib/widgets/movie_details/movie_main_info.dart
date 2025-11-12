import 'package:flutter/material.dart';
import 'package:the_movie_db/gen/assets.gen.dart';
import 'package:the_movie_db/widgets/elements/radial_percent_widget.dart';

class MovieMainInfoWidget extends StatelessWidget {
  const MovieMainInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPosterWidget(),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        SizedBox(
          height: 20,
        ),
        _SummeryWidget(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: Text(
            "Get over here!",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: _OvervieWidget(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3, horizontal: 15),
          child: _DescriptionWidget(),
        ),
        SizedBox(height: 25),
        _PeopleWidget(),
      ],
    );
  }
}

class _OvervieWidget extends StatelessWidget {
  const _OvervieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Обзор",
      style: TextStyle(
        color: Colors.white,
        fontSize: 21,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _DescriptionWidget extends StatelessWidget {
  const _DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Боец смешанных единоборств Коул Янг не раз соглашался проиграть за деньги. Он не знает о своем наследии и почему император Внешнего мира Шан Цзун посылает могущественного криомансера Саб-Зиро на охоту за Коулом. Янг боится за безопасность своей семьи, и майор спецназа Джакс, обладатель такой же отметки в виде дракона, как и у Коула, советует ему отправиться на поиски Сони Блейд. Вскоре Коул, Соня и наёмник Кано оказываются в храме Лорда Рейдена, Старшего Бога и защитника Земного царства, который дает убежище тем, кто носит метку. Здесь прибывшие тренируются с опытными воинами Лю Каном и Кун Лао, готовясь противостоять врагам из Внешнего мира, а для этого им нужно раскрыть в себе аркану — могущественную силу души.',
      style: TextStyle(color: Colors.white),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(Assets.images.mortalCombatBig.path),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: Image(
            image: AssetImage(Assets.images.mortalCombat.path),
            height: 180,
          ),
        ),
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        maxLines: 3,
        text: const TextSpan(
          children: [
            TextSpan(
              text: 'Мортал Комбат',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24),
            ),
            TextSpan(
              text: ' (2021)',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                print('tap on RadialPercentWidget');
              },
              child: const Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: RadialPercentWidget(
                      percent: 0.70,
                      fillColor: Color.fromRGBO(8, 28, 34, 1),
                      lineColor: Color.fromRGBO(32, 192, 114, 1),
                      freeColor: Color.fromRGBO(12, 35, 35, 1),
                      lineWidth: 3,
                      child: Text(
                        '70%',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Рейтинг',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        Container(
          width: 1,
          height: 30,
          color: Colors.white,
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.grey),
          ),
          child: const Row(
            children: [
              Text(
                'Whats your Vibe?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.info,
                color: Colors.white,
                size: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _SummeryWidget extends StatelessWidget {
  const _SummeryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(29, 10, 10, 1),
        border: BoxBorder.all(
          width: 1,
          color: const Color.fromRGBO(23, 8, 8, 1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: '18+',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  TextSpan(
                    text: ' 08/04/2021 (RU) 1h50m',
                    style: TextStyle(color: Colors.white, fontSize: 17.6),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: const EdgeInsets.all(5),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: Size.zero,
                overlayColor: Colors.grey,
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 16,
                  ),
                  Text(
                    ' Воспроизвести трейлер',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              textAlign: TextAlign.center,
              'боевик, фэнтези, приключения',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PeopleWidget extends StatelessWidget {
  const _PeopleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );

    const jobTitleStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );

    return const Column(
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Greg Russo',
                    style: nameStyle,
                  ),
                  Text(
                    'Screenplay, Story',
                    style: jobTitleStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Simon McQuoid',
                    style: nameStyle,
                  ),
                  Text('Director', style: jobTitleStyle),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 1, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Дэйв Каллахэм',
                    style: nameStyle,
                  ),
                  Text('Screenplay', style: jobTitleStyle),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Oren Uziel',
                    style: nameStyle,
                  ),
                  Text('Story', style: jobTitleStyle),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
