import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/helpers/preferences.dart';
import 'package:flutter_guide_2024/providers/theme_provider.dart';
import 'package:flutter_guide_2024/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:flutter_guide_2024/screens/canciones_screen.dart';
import 'package:flutter_guide_2024/screens/canciones_screen_item.dart';
import 'package:flutter_guide_2024/screens/artistas_screen.dart';
import 'package:flutter_guide_2024/screens/artistas_screen_item.dart';
import 'package:flutter_guide_2024/screens/playlist_item_card.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.initShared(); 

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(
        create: (_) => ThemeProvider(isDarkMode: Preferences.darkmode),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Provider.of<ThemeProvider>(context, listen: true);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'home',
        /* theme: Preferences.darkmode ? ThemeData.dark() : ThemeData.light(), */
        theme: tema.temaActual,
        routes: {
          'home': (context) => const HomeScreen(),
          'artistas_screen': (context) => ArtistasScreen(),
          'artistas_screen_item': (context) => ArtistasScreenItem(),
          'design': (context) => const DesignScreen(),
          'listview_builder': (context) => const ListViewBuilderScreen(),
          'listview_separated': (context) => const ListViewSeparatedScreen(),
          'canciones_screen_item': (context) => CancionesScreenItem(),
          
          'list_card': (context) => const ListCardScreen(),
          'material_library': (context) => const MaterialScreen(),
          'counter': (context) => const CounterScreen(),
          'flexbox': (context) => const FlexboxScreen(),
          'swipper_card': (context) => const SwipperScreen(),
          'stack': (context) => const StackScreen(),
          'alert': (context) => const AlertScreen(),
          'animated_container': (context) => const AnimatedContainerScreen(),
          'infinite_scroll': (context) => const InfiniteScrollScreen(),
          'custom_list': (context) => CustomListScreen(),
          'provider_navigation_bar': (context) => BottomNavigationScreen(),
          'provider_navigation_bar_provider': (context) =>
              BottomNavigationProvider(),
          'profile': (context) => const ProfileScreen(),
          'canciones': (context) => CancionesScreen(),
          'playlist_item_card': (context) => PlaylistScreenItem(),
          'playlists': (context) => PlaylistScreen(),
        }
        /* home: DesignScreen(), */
        );
  }
}
