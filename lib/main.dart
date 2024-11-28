import 'package:flutter/material.dart';
import 'package:flutter_guide_2024/helpers/preferences.dart';
import 'package:flutter_guide_2024/providers/theme_provider.dart';
import 'package:flutter_guide_2024/screens/screens.dart';
import 'package:provider/provider.dart';
import 'package:flutter_guide_2024/screens/canciones_screen.dart';
import 'package:flutter_guide_2024/screens/canciones_screen_item.dart';
import 'package:flutter_guide_2024/screens/artistas_screen.dart';
import 'package:flutter_guide_2024/screens/artistas_screen_item.dart';

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
        theme: tema.temaActual,
        routes: {
          'home': (context) => const HomeScreen(),
          'artistas_screen': (context) => ArtistasScreen(),
          'artistas_screen_item': (context) => ArtistasScreenItem(),
          'canciones_screen_item': (context) => CancionesScreenItem(),
          'material_library': (context) => const MaterialScreen(),
          'stack': (context) => const StackScreen(),
          'configuracion': (context) => const ConfiguracionScreen(),
          'canciones': (context) => CancionesScreen(),
          'playlist_item_card': (context) => PlaylistScreenItem(),
          'playlists': (context) => PlaylistScreen(),
        }
        );
  }
}
