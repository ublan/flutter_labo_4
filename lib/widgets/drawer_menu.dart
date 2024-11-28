import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  final List<Map<String, String>> _menuItems = <Map<String, String>>[
    {'route': 'home', 'title': 'Home', 'subtitle': 'Home'},
<<<<<<< HEAD
    {
      'route': 'artistas_screen',
      'title': 'Artistas',
      'subtitle': 'Exposito'
    },
=======
    {'route': 'artistas_screen', 'title': 'Artistas', 'subtitle': 'Exposito'},
>>>>>>> branch-exposito
    {'route': 'playlists', 'title': 'Playlists', 'subtitle': 'Garcia'},
    {'route': 'canciones', 'title': 'Canciones', 'subtitle': 'Blanco'},
    {'route': 'configuracion', 'title': 'Configuracion', 'subtitle': 'Configuracion'},
  ];

  DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeaderAlternative(),
          ...ListTile.divideTiles(
              context: context,
              tiles: _menuItems
                  .map((item) => ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 10),
                        dense: true,
                        minLeadingWidth: 25,
                        iconColor: Colors.blueGrey,
                        title: Text(item['title']!,
                            style: const TextStyle(fontFamily: 'FuzzyBubbles')),
                        subtitle: Text(item['subtitle'] ?? '',
                            style: const TextStyle(
                                fontFamily: 'RobotoMono', fontSize: 11)),
                        leading: const Icon(Icons.arrow_right),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, item['route']!);
                        },
                      ))
                  .toList())
        ],
      ),
    );
  }
}

class _DrawerHeaderAlternative extends StatelessWidget {
  const _DrawerHeaderAlternative();

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      padding: EdgeInsets.zero,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Positioned(
            top: -20,
            left: -20,
            child: AnimatedFloatingCircle(
              size: 100,
              color: Colors.blueAccent.withOpacity(0.3),
            ),
          ),
          Positioned(
            top: 40,
            right: -10,
            child: AnimatedFloatingCircle(
              size: 60,
              color: Colors.amber.withOpacity(0.4),
            ),
          ),
          Positioned(
            bottom: -20,
            left: 70,
            child: AnimatedFloatingCircle(
              size: 120,
              color: Colors.redAccent.withOpacity(0.4),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.8, end: 1.0),
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              builder: (context, scale, child) {
                return Transform.scale(
                  scale: scale,
                  child: child,
                );
              },
              child: const Text(
                '[  Menu  ]',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontFamily: 'RobotoMono',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedFloatingCircle extends StatefulWidget {
  final double size;
  final Color color;

  const AnimatedFloatingCircle({
    super.key,
    required this.size,
    required this.color,
  });

  @override
  _AnimatedFloatingCircleState createState() => _AnimatedFloatingCircleState();
}

class _AnimatedFloatingCircleState extends State<AnimatedFloatingCircle>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -5, end: 5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_animation.value, _animation.value),
          child: Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
