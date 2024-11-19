import 'dart:developer';
import 'package:flutter/material.dart';

class SwipperScreen extends StatelessWidget {
  const SwipperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    log(' ${size.width} ${size.height}');

    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CardPoster(size: size),
              CardDetail(size: size),
              CardHorizontalSwipper(size: size),
            ],
          ),
        ),
      ),
    );
  }
}

class CardHorizontalSwipper extends StatelessWidget {
  final List _castMovies = <Map<String, String>>[
    {
      'image':
          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/86jeYFV40KctQMDQIWhJ5oviNGj.jpg',
      'actor': 'Emilia Clarke',
      'name': 'Daenerys Targaryen',
      'duration': '80 episodios.'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/htGBMno71BJAEGF3Y9f62MdA3Yt.jpg',
      'actor': 'Kit Harington',
      'name': 'Jon Snow',
      'duration': '80 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/lRsRgnksAhBRXwAB68MFjmTtLrk.jpg',
      'actor': 'Peter Dinklage',
      'name': 'Tyrion Lannister',
      'duration': '79 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/n9zXQhjtXQnc30kqF66hdX4i3PG.jpg',
      'actor': 'Iain Glen',
      'name': 'Jorah Mormont',
      'duration': '79 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/5SL4Y4alOYF9EahObfsb6GaDHg4.jpg',
      'actor': 'Lena Headey',
      'name': 'Cersei Lannister',
      'duration': '77 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/zopxZsUZmxZ4sGEfm4cRr7FVoM4.jpg',
      'actor': 'Sophie Turner',
      'name': 'Sansa Stark',
      'duration': '76 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/puWXJbe5ZGnOqJhVr9lEgstvygy.jpg',
      'actor': 'Maisie Williams',
      'name': 'Arya Stark',
      'duration': '75 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/7gPpG0TBMX20tPhWC8BT47x2lnh.jpg',
      'actor': 'Alfie Allen',
      'name': 'Theon Greyjoy',
      'duration': '74 episodios'
    },
    {
      'image':
          'https://www.themoviedb.org/t/p/w138_and_h175_face/zRc8eGN3aFjDapoAKpzWBYBFxCr.jpg',
      'actor': 'Conleth Hill',
      'name': 'Lord Varys, Varys',
      'duration': '72 episodios'
    },
  ];

  CardHorizontalSwipper({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.45,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Staff de la serie'),
              TextButton(
                  onPressed: () {
                    log('click ver mas');
                  },
                  child: const Text('Ver mas')),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: _castMovies.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 10,
                shadowColor: Colors.grey,
                child: Container(
                  width: 150,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: FadeInImage(
                            width: 150,
                            height: 160,
                            fit: BoxFit.cover,
                            placeholder:
                                const AssetImage('assets/images/loading.gif'),
                            image: NetworkImage(_castMovies[index]['image'])),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        _castMovies[index]['actor'],
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(_castMovies[index]['name']),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(_castMovies[index]['duration']),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ]),
    );
  }
}

class CardDetail extends StatelessWidget {
  final Size size;

  const CardDetail({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.15,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Juegos de Tronos',
            style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Mollit ad labore commodo laborum.Mollit ad labore commodo laborum. Mollit ad labore commodo laborum. Veniam irure ad deserunt officia. Voluptate Lorem occaecat commodo ea magna reprehenderit dolore cupidatat ea est do. Mollit ad labore commodo laborum. Veniam irure ad deserunt officia. Voluptate Lorem occaecat commodo ea magna reprehenderit dolore cupidatat ea est do.',
            textAlign: TextAlign.justify,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class CardPoster extends StatelessWidget {
  Size size;
  CardPoster({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.bottomEnd, children: [
      SizedBox(
        width: double.infinity,
        height: size.height * 0.45,
        child: const FadeInImage(
            fit: BoxFit.fill,
            placeholder: AssetImage('assets/images/loading.gif'),
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/z9gCSwIObDOD2BEtmUwfasar3xs.jpg')),
      ),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: GestureDetector(
          onTap: () {
            log('tap search');
          },
          child: const CircleAvatar(
            child: Icon(Icons.search),
          ),
        ),
      ),
      Positioned(
        top: 80,
        left: 10,
        child: GestureDetector(
          onTap: () {
            log('tap volver');
          },
          child: const CircleAvatar(
            child: Icon(
              Icons.arrow_back,
              size: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ]);
  }
}
